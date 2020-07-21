inlets = 1
outlets = 1

async function f() {
    return Promise.resolve(1);
  }
  
  f().then(post('foo')); // 1