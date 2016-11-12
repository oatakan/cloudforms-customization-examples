#----------------------------------------------------------------------------
#
# CFME Automate Method: create_tag_category
#
# Author: Orcun Atakan (Red Hat)
#
# Notes: This method creates a new tag category if it doesn't exists
#
#----------------------------------------------------------------------------

unless $evm.execute('category_exists?', 'vm_role')
  $evm.execute('category_create',
                    :name => 'vm_role',
                    :single_value => false,
                    :perf_by_tag => false,
                    :description => "VM_role")
end

unless $evm.execute('tag_exists?', 'vm_role', 'master')
  $evm.execute('tag_create',
                    'vm_role',
                    :name => 'master',
                    :description => 'Master')
end

unless $evm.execute('tag_exists?', 'vm_role', 'secondary')
  $evm.execute('tag_create',
                    'vm_role',
                    :name => 'secondary',
                    :description => 'Secondary')
end
