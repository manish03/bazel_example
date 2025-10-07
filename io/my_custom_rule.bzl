def write_new_file_impl(ctx):
    output_file = ctx.actions.declare_file(ctx.attr.out_file_name + ".txt")

    # Normalize Windows paths (replace / with \)
    input_path = ctx.file.my_input_file.path.replace("/", "\\")
    output_path = output_file.path.replace("/", "\\")

    ctx.actions.run(
        outputs = [output_file],
        executable = "cmd.exe",
        arguments = [
            "/c",
            "type",
            "\"" + input_path + "\"",
            ">",
            "\"" + output_path + "\"",
        ],
    )

    return DefaultInfo(files = depset([output_file]))


write_new_file = rule(
    implementation = write_new_file_impl,
    attrs = {
        "my_input_file": attr.label(allow_single_file = True),
        "out_file_name": attr.string(),
    },
)

