module VdcsHelper

  def vcenter_name(vcenter)
    vcenter = Vcenter.find(vcenter)
    return vcenter.name
  end
end
