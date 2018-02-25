namespace ATM.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddTransfers : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Transfers",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TargetAccount = c.Int(nullable: false),
                        TransactionID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Transactions", t => t.TransactionID, cascadeDelete: true)
                .Index(t => t.TransactionID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Transfers", "TransactionID", "dbo.Transactions");
            DropIndex("dbo.Transfers", new[] { "TransactionID" });
            DropTable("dbo.Transfers");
        }
    }
}
