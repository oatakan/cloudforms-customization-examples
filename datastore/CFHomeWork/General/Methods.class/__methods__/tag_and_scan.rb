#----------------------------------------------------------------------------
#
# CFME Automate Method: add_tag_and_scan
#
# Author: Orcun Atakan (Red Hat)
#
# Notes: This method adds a tag to vm and perform smart state analysis
#
#----------------------------------------------------------------------------

begin
    vm = $evm.root['vm']
    # add tag from dialog
    vm_role_tags = $evm.root['dialog_vm_role']
    vm_role_tag_name = vm_role_tags[0].name
    $evm.log(:info, "Selected VM Role: #{vm_role_tag_name}")
    unless vm_role_tag_name.nil?
        vm.tag_assign("vm_role/#{vm_role_tag_name}")
    end
    
    # perform smartstate analysis
    ems = vm.ext_management_system
    $evm.log('info', "Starting Scan of VM <#{vm.name}> in VC <#{ems ? ems.name : nil}")
    vm.scan
    
    # add custom key
    time = Time.new
    key   = 'Scanned'
    value = time.inspect
    vm.custom_set(key, value)
    
    $evm.root['ae_result'] = 'ok'
    exit MIQ_OK
rescue => err
    $evm.log(:error, "[#{err}]\n#{err.backtrace.join("\n")}")
    $evm.root['ae_result'] = 'error'
    $evm.root['ae_reason'] = "Error: #{err.message}"
    exit MIQ_ERROR
end
