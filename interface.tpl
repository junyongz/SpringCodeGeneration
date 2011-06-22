package ${package_name};

public interface ${class_name} {
	{{each(i,p) properties}}
	public void set${$item.capitalize(p.name)}(${p.type} ${p.name});
		
	public ${p.type} get${$item.capitalize(p.name)}();
	{{/each}}
}
