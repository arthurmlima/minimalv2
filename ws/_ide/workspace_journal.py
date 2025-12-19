# 2025-12-19T17:59:36.718636300
import vitis

client = vitis.create_client()
client.set_workspace(path="ws")

proj = client.create_sys_project(name="system_project", platform="$COMPONENT_LOCATION/../../LogisticMap/design_1_wrapper.xsa", template="empty_accelerated_application" , build_output_type="xsa")

vitis.dispose()

