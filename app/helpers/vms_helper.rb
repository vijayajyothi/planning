module VmsHelper

  def vms(dc)
    vms =  Vm.where('vdc_id =? AND ops_status !=?', dc,"Deleted").count
  end
  def cpu(dc)
    cpus = Vm.where('vdc_id =? AND ops_status !=?', dc,"Deleted").collect(&:num_cpus).map(&:to_i).sum
    return cpus
  end

  def memory(dc)
    memories = Vm.where('vdc_id =? AND ops_status !=?', dc,"Deleted").collect(&:provisioned_space).map(&:to_f).sum
    return memories
  end

  def used_memory(dc)
    used_memory = Vm.where('vdc_id =? AND ops_status !=?', dc,"Deleted").collect(&:used_space).map(&:to_f).sum
    return used_memory
  end

  def datacenter(vdc_id)
   vdc = Vdc.where(:id=>vdc_id).first
   return vdc.name
 end
end
