# 2025-12-22T15:10:01.892598600
import vitis

client = vitis.create_client()
client.set_workspace(path="ws2")

platform = client.get_component(name="platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../LogisticMap/design_1_wrapper.xsa")

status = client.delete_sys_project(name="system_project")

status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../LogisticMap/design_1_wrapper.xsa")

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../LogisticMap/design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

