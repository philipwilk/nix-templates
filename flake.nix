{
  description = "Personal nix templates"
  outputs = { self }: {
    templates = {
      cpp = {
        path = ./templates/cpp;
        description = "Sample cpp package template";
      };
      
    };
    
  };
}
