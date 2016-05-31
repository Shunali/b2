public class SOQLDynam{

    public map<string,schema.SObjectType> mObjects{get; set;} 
    public map<string,schema.SObjectField> mFields{get; set;}
    public list<selectOption>fsOptions {get;set;}
    public list<selectOption>fnsOptions {get;set;}
    public list<String>objLst {get; set;}
    public list<String>fields {get; set;}
    public list<String>sfields {get; set;}
    public list<String>rfields {get; set;}
    public set<String>fSelected {get; set;}
    public set<String>fNotSelected {get; set;}
    public list<selectOption> objects {get;set;}
    public string objdescription {get;set;}
    public string selectedObjects {get; set;}
    public String query{get; set;}
    public list<SObject> myData{get;set;}
    public list<String> myFields{ get; set;}
    public boolean ptflag{get; set;}
    public String RecordNumber {get; set;}
     String sorts=null;
    public SOQLDynam()
    { 
    
       ptflag=false;
        myFields = new list<string>();    
        myData = new list<SObject>();
        objLst = new list<string>();
        objects = new list<selectOption>(); 
        mFields = new map<string,schema.SObjectField>();
        fsOptions = new list<selectOption>();
        fnsOptions = new list<selectOption>();
        fields = new list<String>();
        sfields = new list<String>();
        rfields = new list<String>();
        fNotSelected = new set<String>();
        fSelected = new set<String>();
        
        mObjects = Schema.getGlobalDescribe();
        objLst.AddAll(mObjects.keySet());
        objLst.sort();
        selectOption n = new selectOption('None','--None--');
        objects.add(n);
        for(String sp: objLst )
        {
            selectOption so = new selectOption(sp,sp);
            objects.add(so);
        }   
    } 
    
    public void Details()
    {
       query=null; 
         myData .clear();
       fnsOptions.clear();
        fsOptions.clear();
        fNotSelected.clear();
        fSelected.clear();
        fields.clear();
    //    myData.clear();
        myFields.clear();  
       if(selectedObjects != 'None')
        {   
        schema.describeSObjectResult objResult = mObjects.get(selectedObjects).getDescribe();
        objdescription =' ' +objResult;
        mFields = mObjects.get(selectedObjects).getDescribe().fields.getmap();
        fields.addAll(mFields.keySet());
        fields.sort();
        system.debug(fields);
        fNotSelected.addAll(fields);
        //fNotSelected.remove('id');
        system.debug('---------');
        system.debug(fnsOptions);
        system.debug(fsOptions);
        system.debug('---------');
        show();
        }
    } 
    
    public void show()
    {
        fnsOptions.clear();
        fsOptions.clear();
        for(String s: fNotSelected)
        {
            selectOption so = new selectOption(s,s);
            fnsOptions.add(so); 
        }
        
        for(String ss: fSelected)
        {
            selectOption so = new selectOption(ss,ss);
            fsOptions.add(so);
        }
        system.debug(fnsOptions);
    }
    
    public void addFields()
    {
    system.debug('2222222'+sfields);

        fNotSelected.removeAll(sfields);
        fSelected.addAll(sfields);
             system.debug('3332222222'+fSelected);
        show();
    }
    
    public void removeFields()
    {
        fNotSelected.AddAll(rfields);
        fSelected.removeAll(rfields);
        show();
    }
    
        public List<SelectOption> getSelectedRecordNumbers() 
    {
  //  system.debug('333333'+RecordNumber);
        List<SelectOption> RecordNumber = new List<SelectOption>();
        
            RecordNumber .add(new SelectOption('5','500'));
            RecordNumber .add(new SelectOption('10','1000'));
            RecordNumber .add(new SelectOption('2','5000'));
            RecordNumber .add(new SelectOption('15','50000'));
       
        return RecordNumber;
     }
     
        public String getSorts() {
        return sorts;
    }
      public void setSorts(String sorts) { this.sorts = sorts; }    
      
       public List<SelectOption> getItems() {
      
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('ASC','Ascending')); 
        options.add(new SelectOption('DESC','Descending')); 
         
        return options; 
    }
     
    public void myQueryData()
        
    {  myFields.clear();  
        query=null; 
         myData .clear();
          
         ptflag=true;
        query='select id';
        myfields.addAll(fSelected);
        for(string s: fSelected)
        {
            query = query+','+s;
            system.debug('@@@'+query );
        }
        query = query+' from '+ selectedObjects +' order by id ' + sorts+' LIMIT '+RecordNumber ;
        myData = Database.query(query);
    }
}