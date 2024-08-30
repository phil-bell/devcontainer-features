# devcontainer-features
repo of dev container features

## Antigen

A dev container feature for managing antigen theme and bundles for zsh.

### Example Usage

```json
"features": {
    "ghcr.io/phil-bell/devcontainer-features/antigen:1": {
        "theme": "romkatv/powerlevel10k",
        "bundles": [
            "zsh-users/zsh-syntax-highlighting",
            "zsh-users/zsh-completions"
        ]
    }
}
```

### Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| theme | Theme to be installed | string | robbyrussell |
| bundles | comma seperated list of antigen bundles to install | string | "" |