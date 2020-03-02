/**
 * Find an object in allNodes via a path
 * @param {PATH} path - path to object
 */
export function getObjectByPath(world, path) {
    //return allNodes[path];
    let terms = path.split(".");
    let obj = world;
    for (let term of terms) {
        obj = obj.getObjectByName(term);
    }
    return obj
}