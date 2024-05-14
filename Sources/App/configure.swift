import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor
import GraphiQLVapor
import Graphiti

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    
    // Enable GraphiQL web page to send queries to the GraphQL endpoint.
    if !app.environment.isRelease {
        app.enableGraphiQL()
    }
    
    app.logger.logLevel = .debug
    
    // GraphQL schema + api registration
    app.register(api: SportService.shared.sportServiceAPI)
    
    // Migrations
    app.migrations.add(UserMigration())
    app.migrations.add(UserSeed())
    
    app.migrations.add(TokenMigration())
    
    app.migrations.add(CoachMigration())
    app.migrations.add(CoachSeed())
    
    app.migrations.add(AthleteMigration())
    app.migrations.add(AthleteSeed())
    
    app.migrations.add(DrillMigration())
    app.migrations.add(DrillSeed())
    
    app.migrations.add(CoachAthleteMigration())
    try await app.autoMigrate().get()
    
    // Register routes
    try routes(app)
}
