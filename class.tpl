package ${package_name};

{{each(i,imp) imports}}
import ${imp};
{{/each}}

{{if annotations}}
  {{each(i,ann) annotations}}
@${ann}
  {{/each}}
{{/if}}
public class ${class_name} {{if implements}}implements ${implements.name}{{/if}}{
        {{each(i,p) properties}}
          {{each(j,ann) p.annotations}}
	@${ann}
	  {{/each}}
	private ${p.type} ${p.name};
        {{/each}}
        {{each(i,p) properties}}
        public void set${$item.capitalize(p.name)}(${p.type} ${p.name}) {
			this.${p.name} = ${p.name};
		}

        public ${p.type} get${$item.capitalize(p.name)}() {
			return this.${p.name};
		}
        {{/each}}
}

