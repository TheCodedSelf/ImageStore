# ImageStore
Store and retrieve UIImages from disk

## Usage

### Store
```
ImageStore.store(image: imageToStore, name: imageName)
```

### Retrieve
```
let retrievedImage = ImageStore.retrieve(imageNamed: imageName)
```

### Delete
```
ImageStore.delete(imageNamed: imageName)
```
