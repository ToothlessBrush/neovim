return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        local jdtls = require("jdtls")
        local mason_path = vim.fn.stdpath("data") .. "/mason"

        local function make_config()
            local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/"
                .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

            return {
                cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-Xmx4g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens", "java.base/java.util=ALL-UNNAMED",
                    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                    "-jar", vim.fn.glob(mason_path .. "/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
                    "-configuration", mason_path .. "/packages/jdtls/config_linux",
                    "-data", workspace_dir,
                },
                root_dir = jdtls.setup.find_root({ ".git", "build.gradle", "gradlew", "pom.xml", "mvnw" }),
                settings = {
                    java = {
                        eclipse = { downloadSources = true },
                        maven = { downloadSources = true },
                        configuration = { updateBuildConfiguration = "interactive" },
                        implementationsCodeLens = { enabled = true },
                        referencesCodeLens = { enabled = true },
                        inlayHints = { parameterNames = { enabled = "all" } },
                        format = { enabled = true },
                    },
                },
                init_options = { bundles = {} },
            }
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                jdtls.start_or_attach(make_config())
            end,
        })
    end,
}
