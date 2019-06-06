function __print_aosp_functions_help() {
cat <<EOF
Additional AOSP functions:
- gerrit:          Adds a remote for AEX Gerrit
EOF
}

function repopick() {
    T=$(gettop)
    $T/vendor/aosp/build/tools/repopick.py $@
}

function gerrit()
{
    if [ ! -d ".git" ]; then
        echo -e "Please run this inside a git directory";
    else
        if [[ ! -z $(git config --get remote.gerrit.url) ]]; then
            git remote rm gerrit;
        fi
        [[ -z "${GERRIT_USER}" ]] && export GERRIT_USER=$(git config --get gerrit.aospextended.com.username);
        if [[ -z "${GERRIT_USER}" ]]; then
            git remote add gerrit $(git remote -v | grep AospExtended | awk '{print $2}' | uniq | sed -e "s|https://github.com/AospExtended|ssh://gerrit.aospextended.com:29418/AospExtended|");
        else
            git remote add gerrit $(git remote -v | grep AospExtended | awk '{print $2}' | uniq | sed -e "s|https://github.com/AospExtended|ssh://${GERRIT_USER}@gerrit.aospextended.com:29418/AospExtended|");
        fi
    fi
}

function fixup_common_out_dir() {
    common_out_dir=$(get_build_var OUT_DIR)/target/common
    target_device=$(get_build_var TARGET_DEVICE)
    if [ ! -z $AOSP_FIXUP_COMMON_OUT ]; then
        if [ -d ${common_out_dir} ] && [ ! -L ${common_out_dir} ]; then
            mv ${common_out_dir} ${common_out_dir}-${target_device}
            ln -s ${common_out_dir}-${target_device} ${common_out_dir}
        else
            [ -L ${common_out_dir} ] && rm ${common_out_dir}
            mkdir -p ${common_out_dir}-${target_device}
            ln -s ${common_out_dir}-${target_device} ${common_out_dir}
        fi
    else
        [ -L ${common_out_dir} ] && rm ${common_out_dir}
        mkdir -p ${common_out_dir}
    fi
}

# Enable SD-LLVM if available
if [ -d $(gettop)/vendor/qcom/sdclang ]; then
            export SDCLANG=true
            export SDCLANG_PATH="vendor/qcom/sdclang/6.0/prebuilt/linux-x86_64/bin"
            export SDCLANG_LTO_DEFS="vendor/qcom/sdclang/sdllvm-lto-defs.mk"
            export SDCLANG_CONFIG="vendor/qcom/sdclang/sdclang.json"
            export SDCLANG_AE_CONFIG="vendor/qcom/sdclang/sdclangAE.json"
            export SDCLANG_COMMON_FLAGS="-O3 -Wno-user-defined-warnings -Wno-vectorizer-no-neon -Wno-unknown-warning-option \
-Wno-deprecated-register -Wno-tautological-type-limit-compare -Wno-sign-compare -Wno-gnu-folding-constant \
-mllvm -arm-implicit-it=always -Wno-inline-asm -Wno-unused-command-line-argument -Wno-unused-variable"
fi
