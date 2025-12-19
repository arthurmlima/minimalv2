# 2025-12-19T18:02:41.848968800
import vitis

client = vitis.create_client()
client.set_workspace(path="ws2")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../LogisticMap/design_1_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

proj = client.create_sys_project(name="system_project", platform="$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm", template="empty_accelerated_application" , build_output_type="xsa")

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

