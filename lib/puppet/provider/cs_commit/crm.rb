require File.join(File.dirname(__FILE__), '..', 'corosync')

Puppet::Type.type(:cs_commit).provide(:crm, :parent => Puppet::Provider::Corosync) do
  commands :crm => 'crm'
  commands :crm_attribute => 'crm_attribute'

  def self.instances
    block_until_ready
    []
  end

  def commit(cib)
    crm "cib", "commit", cib
  end
end