box.cfg{
    listen = 3301,
    replication = {
        'replicator:password@tarantool1:3301', -- master URI
    },
    read_only = false -- true = replica mode, false = master mode
}
box.once("schema", function()
    box.schema.user.create('replicator', {password = 'password'})
    box.schema.user.grant('replicator', 'replication') -- grant replication role
    -- box.schema.space.create("test")
    -- box.space.test:create_index("primary")
    print('box.once executed on master')
end)
