module VmsHelper

  def vms(dc)
    vms =  Vm.where(:datacenter=> dc).count
  end
  def cpu(dc)
    cpus = Vm.where(:datacenter=>dc).collect(&:numcpu).map(&:to_i).sum
    return cpus
  end

  def memory(dc)
    memories = Vm.where(:datacenter=>dc).collect(&:provisionedspacegb).map(&:to_f).sum
    return memories
  end

  def used_memory(dc)
    used_memory = Vm.where(:datacenter=>dc).collect(&:usedspacegb).map(&:to_f).sum
    return used_memory
  end
end
