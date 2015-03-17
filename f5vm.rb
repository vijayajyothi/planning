class Vm
  f5vips = F5Vip.all
  f5vips.each do |each_vip|
    @f5pool = F5Pool.where(:f5_vip_id=>@f5_vip.id).last
    @f5nodes = F5Node.where(:f5_pool_id=>@f5pool.id)
    @f5nodes.each do |each_f5node|

     @vm = Vm.where(:ip=>each_f5node.ip).first 

     if @vm.present?

    p @vm.name
     end 
   end 


 end

end
