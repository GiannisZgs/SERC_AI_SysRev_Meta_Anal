%Gather arousal, valence ratings for self, partner and external raters
%One vector for each rater, for arousal and valence separately across all subjects

close all
clear

arousal_self = [];
valence_self = [];
cheerful_self = [];
happy_self = [];
angry_self = [];
nervous_self = [];
sad_self = [];
categorical_self = [];

arousal_partner = [];
valence_partner = [];
cheerful_partner = [];
happy_partner = [];
angry_partner = [];
nervous_partner = [];
sad_partner = [];
categorical_partner = [];

arousal_aggregated = [];
valence_aggregated = [];
cheerful_aggregated = [];
happy_aggregated = [];
angry_aggregated = [];
nervous_aggregated = [];
sad_aggregated = [];
categorical_aggregated = [];

arousal_R1 = [];
valence_R1 = [];
cheerful_R1 = [];
happy_R1 = [];
angry_R1 = [];
nervous_R1 = [];
sad_R1 = [];
categorical_R1 = [];

arousal_R2 = [];
valence_R2 = [];
cheerful_R2 = [];
happy_R2 = [];
angry_R2 = [];
nervous_R2 = [];
sad_R2 = [];
categorical_R2 = [];

arousal_R3 = [];
valence_R3 = [];
cheerful_R3 = [];
happy_R3 = [];
angry_R3 = [];
nervous_R3 = [];
sad_R3 = [];
categorical_R3 = [];

arousal_R4 = [];
valence_R4 = [];
cheerful_R4 = [];
happy_R4 = [];
angry_R4 = [];
nervous_R4 = [];
sad_R4 = [];
categorical_R4 = [];

arousal_R5 = [];
valence_R5 = [];
cheerful_R5 = [];
happy_R5 = [];
angry_R5 = [];
nervous_R5 = [];
sad_R5 = [];
categorical_R5 = [];



data_struct = load('kemocon_data_struct.mat'); %data_struct
data_struct = data_struct.data_struct;

%Self

self_annotations = data_struct.annotations.self_annotations;
self_fields = fields(self_annotations);
self_sequence = [];
for s = 1:length(self_fields)
    self_pid = regexp(self_fields{s},'\d*','Match'); %isolates number in a string
    self_pid = convertCharsToStrings(self_pid);
    subject_self = self_annotations.(self_fields{s});
    arousal_self = [arousal_self; subject_self.arousal];
    valence_self = [valence_self; subject_self.valence];
    cheerful_self = [cheerful_self; subject_self.cheerful];
    happy_self = [happy_self; subject_self.happy];
    angry_self = [angry_self; subject_self.angry];
    nervous_self = [nervous_self; subject_self.nervous];
    sad_self = [sad_self; subject_self.sad];
    A = subject_self(:,4:8);
    names = A.Properties.VariableNames;
    B = NaN(height(A),1);
    for a = 1:height(A)
        aa = A(a,:);
        [m,ind] = max(table2array(aa));
        if sum(table2array(aa) == m) > 1
            B(a) = 0;
        else
            B(a) = ind;
        end
    end
    categorical_self = [categorical_self; B];
    self_sequence = [self_sequence; self_pid];

end

%Partner
partner_annotations = data_struct.annotations.partner_annotations;
partner_fields = fields(partner_annotations);
partner_sequence = [];
for p = 1:length(partner_fields)
    partner_pid = regexp(partner_fields{p},'\d*','Match'); %isolates number in a string
    partner_pid = convertCharsToStrings(partner_pid);
    subject_partner = partner_annotations.(partner_fields{p});
    arousal_partner = [arousal_partner; subject_partner.arousal];
    valence_partner = [valence_partner; subject_partner.valence];

    cheerful_partner = [cheerful_partner; subject_partner.cheerful];
    happy_partner = [happy_partner; subject_partner.happy];
    angry_partner = [angry_partner; subject_partner.angry];
    nervous_partner = [nervous_partner; subject_partner.nervous];
    sad_partner = [sad_partner; subject_partner.sad];
    A = subject_partner(:,4:8);
    names = A.Properties.VariableNames;
    B = NaN(height(A),1);
    for a = 1:height(A)
        aa = A(a,:);
        [m,ind] = max(table2array(aa));
        if sum(table2array(aa) == m) > 1
            B(a) = 0;
        else
            B(a) = ind;
        end
    end
    categorical_partner = [categorical_partner; B];

    partner_sequence = [partner_sequence; partner_pid];
end

%External individual
external_annotations = data_struct.annotations.external_annotations;
external_fields = fields(external_annotations);
ext_sequence = []; 
for e = 1:length(external_fields)
    ext_pid = regexp(external_fields{e},'\d*','Match'); %isolates number in a string
    ext_rid = convertCharsToStrings(ext_pid{2}); %rater ID
    ext_pid = convertCharsToStrings(ext_pid{1}); %participant ID    
    subject_ext = external_annotations.(external_fields{e});
    if str2num(ext_rid) == 1
        arousal_R1 = [arousal_R1; subject_ext.arousal];
        valence_R1 = [valence_R1; subject_ext.valence];
        
        cheerful_R1 = [cheerful_R1; subject_ext.cheerful];
        happy_R1 = [happy_R1; subject_ext.happy];
        angry_R1 = [angry_R1; subject_ext.angry];
        nervous_R1 = [nervous_R1; subject_ext.nervous];
        sad_R1 = [sad_R1; subject_ext.sad];
        A = subject_ext(:,4:8);
        names = A.Properties.VariableNames;
        B = NaN(height(A),1);
        for a = 1:height(A)
            aa = A(a,:);
            [m,ind] = max(table2array(aa));
            if sum(table2array(aa) == m) > 1
                B(a) = 0;
            else
                B(a) = ind;
            end
        end
        categorical_R1 = [categorical_R1; B];

    elseif str2num(ext_rid) == 2
        arousal_R2 = [arousal_R2; subject_ext.arousal];
        valence_R2 = [valence_R2; subject_ext.valence];
        
        cheerful_R2 = [cheerful_R2; subject_ext.cheerful];
        happy_R2 = [happy_R2; subject_ext.happy];
        angry_R2 = [angry_R2; subject_ext.angry];
        nervous_R2 = [nervous_R2; subject_ext.nervous];
        sad_R2 = [sad_R2; subject_ext.sad];
        A = subject_ext(:,4:8);
        names = A.Properties.VariableNames;
        B = NaN(height(A),1);
        for a = 1:height(A)
            aa = A(a,:);
            [m,ind] = max(table2array(aa));
            if sum(table2array(aa) == m) > 1
                B(a) = 0;
            else
                B(a) = ind;
            end
        end
        categorical_R2 = [categorical_R2; B];

    elseif str2num(ext_rid) == 3
        arousal_R3 = [arousal_R3; subject_ext.arousal];
        valence_R3 = [valence_R3; subject_ext.valence];

        cheerful_R3 = [cheerful_R3; subject_ext.cheerful];
        happy_R3 = [happy_R3; subject_ext.happy];
        angry_R3 = [angry_R3; subject_ext.angry];
        nervous_R3 = [nervous_R3; subject_ext.nervous];
        sad_R3 = [sad_R3; subject_ext.sad];
        A = subject_ext(:,4:8);
        names = A.Properties.VariableNames;
        B = NaN(height(A),1);
        for a = 1:height(A)
            aa = A(a,:);
            [m,ind] = max(table2array(aa));
            if sum(table2array(aa) == m) > 1
                B(a) = 0;
            else
                B(a) = ind;
            end
        end
        categorical_R3 = [categorical_R3; B];

    elseif str2num(ext_rid) == 4
        arousal_R4 = [arousal_R4; subject_ext.arousal];
        valence_R4 = [valence_R4; subject_ext.valence];
        cheerful_R4 = [cheerful_R4; subject_ext.cheerful];
        happy_R4 = [happy_R4; subject_ext.happy];
        angry_R4 = [angry_R4; subject_ext.angry];
        nervous_R4 = [nervous_R4; subject_ext.nervous];
        sad_R4 = [sad_R4; subject_ext.sad];
        A = subject_ext(:,4:8);
        names = A.Properties.VariableNames;
        B = NaN(height(A),1);
        for a = 1:height(A)
            aa = A(a,:);
            [m,ind] = max(table2array(aa));
            if sum(table2array(aa) == m) > 1
                B(a) = 0;
            else
                B(a) = ind;
            end
        end
        categorical_R4 = [categorical_R4; B];

    elseif str2num(ext_rid) == 5
        arousal_R5 = [arousal_R5; subject_ext.arousal];
        valence_R5 = [valence_R5; subject_ext.valence];

        cheerful_R5 = [cheerful_R5; subject_ext.cheerful];
        happy_R5 = [happy_R5; subject_ext.happy];
        angry_R5 = [angry_R5; subject_ext.angry];
        nervous_R5 = [nervous_R5; subject_ext.nervous];
        sad_R5 = [sad_R5; subject_ext.sad];
        A = subject_ext(:,4:8);
        names = A.Properties.VariableNames;
        B = NaN(height(A),1);
        for a = 1:height(A)
            aa = A(a,:);
            [m,ind] = max(table2array(aa));
            if sum(table2array(aa) == m) > 1
                B(a) = 0;
            else
                B(a) = ind;
            end
        end
        categorical_R5 = [categorical_R5; B];

    end
    ext_sequence = [ext_sequence; ext_pid];
end
ext_sequence = unique(ext_sequence);

% Aggregated external
aggregated_annotations = data_struct.annotations.aggregated_external_annotations;
aggregated_fields = fields(aggregated_annotations);
aggregated_sequence = [];
for g = 1:length(aggregated_fields)
    aggregated_pid = regexp(aggregated_fields{g},'\d*','Match'); %isolates number in a string
    aggregated_pid = convertCharsToStrings(aggregated_pid);
    subject_aggregated = aggregated_annotations.(aggregated_fields{g});
    arousal_aggregated = [arousal_aggregated; subject_aggregated.arousal];
    valence_aggregated = [valence_aggregated; subject_aggregated.valence];

    cheerful_aggregated = [cheerful_aggregated; subject_aggregated.cheerful];
    happy_aggregated = [happy_aggregated; subject_aggregated.happy];
    angry_aggregated = [angry_aggregated; subject_aggregated.angry];
    nervous_aggregated = [nervous_aggregated; subject_aggregated.nervous];
    sad_aggregated = [sad_aggregated; subject_aggregated.sad];
    A = subject_aggregated(:,4:8);
    names = A.Properties.VariableNames;
    B = NaN(height(A),1);
    for a = 1:height(A)
        aa = A(a,:);
        [m,ind] = max(table2array(aa));
        if sum(table2array(aa) == m) > 1
            B(a) = 0;
        else
            B(a) = ind;
        end
    end
    categorical_aggregated = [categorical_aggregated; B];

    aggregated_sequence = [aggregated_sequence; aggregated_pid];
end

c1 = sum(self_sequence == partner_sequence);
c2 = sum(self_sequence == ext_sequence);
c3 = sum(self_sequence == aggregated_sequence);

max_height = 4187;
min_height = 4155;

angry_aggregated = angry_aggregated(1:min_height);
angry_partner = angry_partner(1:min_height);
angry_self = angry_self(1:min_height);
angry_R1 = angry_R1(1:min_height);
angry_R2 = angry_R2(1:min_height);
angry_R3 = angry_R3(1:min_height);
angry_R4 = angry_R4(1:min_height);
angry_R5 = angry_R5(1:min_height);
angry_tab = array2table([angry_self angry_partner angry_R1 angry_R2 angry_R3 angry_R4 angry_R5 angry_aggregated]);
angry_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_angry_SP = cronbach([angry_tab.self,angry_tab.partner]);
cronbach_angry_SR1 = cronbach([angry_tab.self,angry_tab.R1]);
cronbach_angry_SR2 = cronbach([angry_tab.self,angry_tab.R2]);
cronbach_angry_SR3 = cronbach([angry_tab.self,angry_tab.R3]);
cronbach_angry_SR4 = cronbach([angry_tab.self,angry_tab.R4]);
cronbach_angry_SR5 = cronbach([angry_tab.self,angry_tab.R5]);
cronbach_angry_SRAX = cronbach([angry_tab.self,angry_tab.aggregated_external]);
cronbach_angry_PR1 = cronbach([angry_tab.partner,angry_tab.R1]);
cronbach_angry_PR2 = cronbach([angry_tab.partner,angry_tab.R2]);
cronbach_angry_PR3 = cronbach([angry_tab.partner,angry_tab.R3]);
cronbach_angry_PR4 = cronbach([angry_tab.partner,angry_tab.R4]);
cronbach_angry_PR5 = cronbach([angry_tab.partner,angry_tab.R5]);
cronbach_angry_PRAX = cronbach([angry_tab.partner,angry_tab.aggregated_external]);
angry_plot = [cronbach_angry_SP,cronbach_angry_SR1,cronbach_angry_SR2,cronbach_angry_SR3,cronbach_angry_SR4,cronbach_angry_SR5,cronbach_angry_SRAX,cronbach_angry_PR1,cronbach_angry_PR2,cronbach_angry_PR3,cronbach_angry_PR4,cronbach_angry_PR5,cronbach_angry_PRAX];
x = categorical({'S-P','S-R1','S-R2','S-R3','S-R4','S-R5',...
    'S-RAgg','P-R1','P-R2','P-R3','P-R4','P-R5','P-RAgg'});
x = reordercats(x,{'S-P','S-R1','S-R2','S-R3','S-R4','S-R5',...
    'S-RAgg','P-R1','P-R2','P-R3','P-R4','P-R5','P-RAgg'});
figure;
bar(x,angry_plot)
title("Angry")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'angry_cronbach','-dpng')

arousal_aggregated = arousal_aggregated(1:min_height);
arousal_R1 = arousal_R1(1:min_height);
arousal_R2 = arousal_R2(1:min_height);
arousal_R3 = arousal_R3(1:min_height);
arousal_R4 = arousal_R4(1:min_height);
arousal_R5 = arousal_R5(1:min_height);
arousal_partner = arousal_partner(1:min_height);
arousal_self = arousal_self(1:min_height);
arousal_tab = array2table([arousal_self arousal_partner arousal_R1 arousal_R2 arousal_R3 arousal_R4 arousal_R5 arousal_aggregated]);
arousal_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_arousal_SP = cronbach([arousal_tab.self,arousal_tab.partner]);
cronbach_arousal_SR1 = cronbach([arousal_tab.self,arousal_tab.R1]);
cronbach_arousal_SR2 = cronbach([arousal_tab.self,arousal_tab.R2]);
cronbach_arousal_SR3 = cronbach([arousal_tab.self,arousal_tab.R3]);
cronbach_arousal_SR4 = cronbach([arousal_tab.self,arousal_tab.R4]);
cronbach_arousal_SR5 = cronbach([arousal_tab.self,arousal_tab.R5]);
cronbach_arousal_SRAX = cronbach([arousal_tab.self,arousal_tab.aggregated_external]);
cronbach_arousal_PR1 = cronbach([arousal_tab.partner,arousal_tab.R1]);
cronbach_arousal_PR2 = cronbach([arousal_tab.partner,arousal_tab.R2]);
cronbach_arousal_PR3 = cronbach([arousal_tab.partner,arousal_tab.R3]);
cronbach_arousal_PR4 = cronbach([arousal_tab.partner,arousal_tab.R4]);
cronbach_arousal_PR5 = cronbach([arousal_tab.partner,arousal_tab.R5]);
cronbach_arousal_PRAX = cronbach([arousal_tab.partner,arousal_tab.aggregated_external]);
arousal_plot = [cronbach_arousal_SP,cronbach_arousal_SR1,cronbach_arousal_SR2,cronbach_arousal_SR3,cronbach_arousal_SR4,cronbach_arousal_SR5,cronbach_arousal_SRAX,cronbach_arousal_PR1,cronbach_arousal_PR2,cronbach_arousal_PR3,cronbach_arousal_PR4,cronbach_arousal_PR5,cronbach_arousal_PRAX];
figure;
bar(x,arousal_plot)
title("Arousal")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'arousal_cronbach','-dpng')


categorical_aggregated = categorical_aggregated(1:min_height);
categorical_partner = categorical_partner(1:min_height);
categorical_R1 = categorical_R1(1:min_height);
categorical_R2 = categorical_R2(1:min_height);
categorical_R3 = categorical_R3(1:min_height);
categorical_R4 = categorical_R4(1:min_height);
categorical_R5 = categorical_R5(1:min_height);
categorical_self = categorical_self(1:min_height);
categorical_tab = array2table([categorical_self categorical_partner categorical_R1 categorical_R2 categorical_R3 categorical_R4 categorical_R5 categorical_aggregated]);
categorical_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_categorical_SP = cronbach([categorical_tab.self,categorical_tab.partner]);
cronbach_categorical_SR1 = cronbach([categorical_tab.self,categorical_tab.R1]);
cronbach_categorical_SR2 = cronbach([categorical_tab.self,categorical_tab.R2]);
cronbach_categorical_SR3 = cronbach([categorical_tab.self,categorical_tab.R3]);
cronbach_categorical_SR4 = cronbach([categorical_tab.self,categorical_tab.R4]);
cronbach_categorical_SR5 = cronbach([categorical_tab.self,categorical_tab.R5]);
cronbach_categorical_SRAX = cronbach([categorical_tab.self,categorical_tab.aggregated_external]);
cronbach_categorical_PR1 = cronbach([categorical_tab.partner,categorical_tab.R1]);
cronbach_categorical_PR2 = cronbach([categorical_tab.partner,categorical_tab.R2]);
cronbach_categorical_PR3 = cronbach([categorical_tab.partner,categorical_tab.R3]);
cronbach_categorical_PR4 = cronbach([categorical_tab.partner,categorical_tab.R4]);
cronbach_categorical_PR5 = cronbach([categorical_tab.partner,categorical_tab.R5]);
cronbach_categorical_PRAX = cronbach([categorical_tab.partner,categorical_tab.aggregated_external]);
categorical_plot = [cronbach_categorical_SP,cronbach_categorical_SR1,cronbach_categorical_SR2,cronbach_categorical_SR3,cronbach_categorical_SR4,cronbach_categorical_SR5,cronbach_categorical_SRAX,cronbach_categorical_PR1,cronbach_categorical_PR2,cronbach_categorical_PR3,cronbach_categorical_PR4,cronbach_categorical_PR5,cronbach_categorical_PRAX];
figure;
bar(x,categorical_plot)
title("Categorical")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'categorical_cronbach','-dpng')


cheerful_aggregated = cheerful_aggregated(1:min_height);
cheerful_partner = cheerful_partner(1:min_height);
cheerful_R1 = cheerful_R1(1:min_height);
cheerful_R2 = cheerful_R2(1:min_height);
cheerful_R3 = cheerful_R3(1:min_height);
cheerful_R4 = cheerful_R4(1:min_height);
cheerful_R5 = cheerful_R5(1:min_height);
cheerful_self = cheerful_self(1:min_height);
cheerful_tab = array2table([cheerful_self cheerful_partner cheerful_R1 cheerful_R2 cheerful_R3 cheerful_R4 cheerful_R5 cheerful_aggregated]);
cheerful_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_cheerful_SP = cronbach([cheerful_tab.self,cheerful_tab.partner]);
cronbach_cheerful_SR1 = cronbach([cheerful_tab.self,cheerful_tab.R1]);
cronbach_cheerful_SR2 = cronbach([cheerful_tab.self,cheerful_tab.R2]);
cronbach_cheerful_SR3 = cronbach([cheerful_tab.self,cheerful_tab.R3]);
cronbach_cheerful_SR4 = cronbach([cheerful_tab.self,cheerful_tab.R4]);
cronbach_cheerful_SR5 = cronbach([cheerful_tab.self,cheerful_tab.R5]);
cronbach_cheerful_SRAX = cronbach([cheerful_tab.self,cheerful_tab.aggregated_external]);
cronbach_cheerful_PR1 = cronbach([cheerful_tab.partner,cheerful_tab.R1]);
cronbach_cheerful_PR2 = cronbach([cheerful_tab.partner,cheerful_tab.R2]);
cronbach_cheerful_PR3 = cronbach([cheerful_tab.partner,cheerful_tab.R3]);
cronbach_cheerful_PR4 = cronbach([cheerful_tab.partner,cheerful_tab.R4]);
cronbach_cheerful_PR5 = cronbach([cheerful_tab.partner,cheerful_tab.R5]);
cronbach_cheerful_PRAX = cronbach([cheerful_tab.partner,cheerful_tab.aggregated_external]);
cheerful_plot = [cronbach_cheerful_SP,cronbach_cheerful_SR1,cronbach_cheerful_SR2,cronbach_cheerful_SR3,cronbach_cheerful_SR4,cronbach_cheerful_SR5,cronbach_cheerful_SRAX,cronbach_cheerful_PR1,cronbach_cheerful_PR2,cronbach_cheerful_PR3,cronbach_cheerful_PR4,cronbach_cheerful_PR5,cronbach_cheerful_PRAX];
figure;
bar(x,cheerful_plot)
title("Cheerful")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'cheerful_cronbach','-dpng')


happy_aggregated = happy_aggregated(1:min_height);
happy_partner = happy_partner(1:min_height);
happy_R1 = happy_R1(1:min_height);
happy_R2 = happy_R2(1:min_height);
happy_R3 = happy_R3(1:min_height);
happy_R4 = happy_R4(1:min_height);
happy_R5 = happy_R5(1:min_height);
happy_self = happy_self(1:min_height);
happy_tab = array2table([happy_self happy_partner happy_R1 happy_R2 happy_R3 happy_R4 happy_R5 happy_aggregated]);
happy_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_happy_SP = cronbach([happy_tab.self,happy_tab.partner]);
cronbach_happy_SR1 = cronbach([happy_tab.self,happy_tab.R1]);
cronbach_happy_SR2 = cronbach([happy_tab.self,happy_tab.R2]);
cronbach_happy_SR3 = cronbach([happy_tab.self,happy_tab.R3]);
cronbach_happy_SR4 = cronbach([happy_tab.self,happy_tab.R4]);
cronbach_happy_SR5 = cronbach([happy_tab.self,happy_tab.R5]);
cronbach_happy_SRAX = cronbach([happy_tab.self,happy_tab.aggregated_external]);
cronbach_happy_PR1 = cronbach([happy_tab.partner,happy_tab.R1]);
cronbach_happy_PR2 = cronbach([happy_tab.partner,happy_tab.R2]);
cronbach_happy_PR3 = cronbach([happy_tab.partner,happy_tab.R3]);
cronbach_happy_PR4 = cronbach([happy_tab.partner,happy_tab.R4]);
cronbach_happy_PR5 = cronbach([happy_tab.partner,happy_tab.R5]);
cronbach_happy_PRAX = cronbach([happy_tab.partner,happy_tab.aggregated_external]);
happy_plot = [cronbach_happy_SP,cronbach_happy_SR1,cronbach_happy_SR2,cronbach_happy_SR3,cronbach_happy_SR4,cronbach_happy_SR5,cronbach_happy_SRAX,cronbach_happy_PR1,cronbach_happy_PR2,cronbach_happy_PR3,cronbach_happy_PR4,cronbach_happy_PR5,cronbach_happy_PRAX];
figure;
bar(x,happy_plot)
title("Happy")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'happy_cronbach','-dpng')


nervous_aggregated = nervous_aggregated(1:min_height);
nervous_partner = nervous_partner(1:min_height);
nervous_R1 = nervous_R1(1:min_height);
nervous_R2 = nervous_R2(1:min_height);
nervous_R3 = nervous_R3(1:min_height);
nervous_R4 = nervous_R4(1:min_height);
nervous_R5 = nervous_R5(1:min_height);
nervous_self = nervous_self(1:min_height);
nervous_tab = array2table([nervous_self nervous_partner nervous_R1 nervous_R2 nervous_R3 nervous_R4 nervous_R5 nervous_aggregated]);
nervous_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_nervous_SP = cronbach([nervous_tab.self,nervous_tab.partner]);
cronbach_nervous_SR1 = cronbach([nervous_tab.self,nervous_tab.R1]);
cronbach_nervous_SR2 = cronbach([nervous_tab.self,nervous_tab.R2]);
cronbach_nervous_SR3 = cronbach([nervous_tab.self,nervous_tab.R3]);
cronbach_nervous_SR4 = cronbach([nervous_tab.self,nervous_tab.R4]);
cronbach_nervous_SR5 = cronbach([nervous_tab.self,nervous_tab.R5]);
cronbach_nervous_SRAX = cronbach([nervous_tab.self,nervous_tab.aggregated_external]);
cronbach_nervous_PR1 = cronbach([nervous_tab.partner,nervous_tab.R1]);
cronbach_nervous_PR2 = cronbach([nervous_tab.partner,nervous_tab.R2]);
cronbach_nervous_PR3 = cronbach([nervous_tab.partner,nervous_tab.R3]);
cronbach_nervous_PR4 = cronbach([nervous_tab.partner,nervous_tab.R4]);
cronbach_nervous_PR5 = cronbach([nervous_tab.partner,nervous_tab.R5]);
cronbach_nervous_PRAX = cronbach([nervous_tab.partner,nervous_tab.aggregated_external]);
nervous_plot = [cronbach_nervous_SP,cronbach_nervous_SR1,cronbach_nervous_SR2,cronbach_nervous_SR3,cronbach_nervous_SR4,cronbach_nervous_SR5,cronbach_nervous_SRAX,cronbach_nervous_PR1,cronbach_nervous_PR2,cronbach_nervous_PR3,cronbach_nervous_PR4,cronbach_nervous_PR5,cronbach_nervous_PRAX];
figure;
bar(x,nervous_plot)
title("Nervous")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'nervous_cronbach','-dpng')


sad_aggregated = sad_aggregated(1:min_height);
sad_partner = sad_partner(1:min_height);
sad_R1 = sad_R1(1:min_height);
sad_R2 = sad_R2(1:min_height);
sad_R3 = sad_R3(1:min_height);
sad_R4 = sad_R4(1:min_height);
sad_R5 = sad_R5(1:min_height);
sad_self = sad_self(1:min_height);
sad_tab = array2table([sad_self sad_partner sad_R1 sad_R2 sad_R3 sad_R4 sad_R5 sad_aggregated]);
sad_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_sad_SP = cronbach([sad_tab.self,sad_tab.partner]);
cronbach_sad_SR1 = cronbach([sad_tab.self,sad_tab.R1]);
cronbach_sad_SR2 = cronbach([sad_tab.self,sad_tab.R2]);
cronbach_sad_SR3 = cronbach([sad_tab.self,sad_tab.R3]);
cronbach_sad_SR4 = cronbach([sad_tab.self,sad_tab.R4]);
cronbach_sad_SR5 = cronbach([sad_tab.self,sad_tab.R5]);
cronbach_sad_SRAX = cronbach([sad_tab.self,sad_tab.aggregated_external]);
cronbach_sad_PR1 = cronbach([sad_tab.partner,sad_tab.R1]);
cronbach_sad_PR2 = cronbach([sad_tab.partner,sad_tab.R2]);
cronbach_sad_PR3 = cronbach([sad_tab.partner,sad_tab.R3]);
cronbach_sad_PR4 = cronbach([sad_tab.partner,sad_tab.R4]);
cronbach_sad_PR5 = cronbach([sad_tab.partner,sad_tab.R5]);
cronbach_sad_PRAX = cronbach([sad_tab.partner,sad_tab.aggregated_external]);
sad_plot = [cronbach_sad_SP,cronbach_sad_SR1,cronbach_sad_SR2,cronbach_sad_SR3,cronbach_sad_SR4,cronbach_sad_SR5,cronbach_sad_SRAX,cronbach_sad_PR1,cronbach_sad_PR2,cronbach_sad_PR3,cronbach_sad_PR4,cronbach_sad_PR5,cronbach_sad_PRAX];
figure;
bar(x,sad_plot)
title("Sad")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'sad_cronbach','-dpng')


valence_aggregated = valence_aggregated(1:min_height);
valence_partner = valence_partner(1:min_height);
valence_R1 = valence_R1(1:min_height);
valence_R2 = valence_R2(1:min_height);
valence_R3 = valence_R3(1:min_height);
valence_R4 = valence_R4(1:min_height);
valence_R5 = valence_R5(1:min_height);
valence_self = valence_self(1:min_height);
valence_tab = array2table([valence_self valence_partner valence_R1 valence_R2 valence_R3 valence_R4 valence_R5 valence_aggregated]);
valence_tab.Properties.VariableNames = {'self','partner','R1','R2','R3','R4','R5','aggregated_external'};
cronbach_valence_SP = cronbach([valence_tab.self,valence_tab.partner]);
cronbach_valence_SR1 = cronbach([valence_tab.self,valence_tab.R1]);
cronbach_valence_SR2 = cronbach([valence_tab.self,valence_tab.R2]);
cronbach_valence_SR3 = cronbach([valence_tab.self,valence_tab.R3]);
cronbach_valence_SR4 = cronbach([valence_tab.self,valence_tab.R4]);
cronbach_valence_SR5 = cronbach([valence_tab.self,valence_tab.R5]);
cronbach_valence_SRAX = cronbach([valence_tab.self,valence_tab.aggregated_external]);
cronbach_valence_PR1 = cronbach([valence_tab.partner,valence_tab.R1]);
cronbach_valence_PR2 = cronbach([valence_tab.partner,valence_tab.R2]);
cronbach_valence_PR3 = cronbach([valence_tab.partner,valence_tab.R3]);
cronbach_valence_PR4 = cronbach([valence_tab.partner,valence_tab.R4]);
cronbach_valence_PR5 = cronbach([valence_tab.partner,valence_tab.R5]);
cronbach_valence_PRAX = cronbach([valence_tab.partner,valence_tab.aggregated_external]);
valence_plot = [cronbach_valence_SP,cronbach_valence_SR1,cronbach_valence_SR2,cronbach_valence_SR3,cronbach_valence_SR4,cronbach_valence_SR5,cronbach_valence_SRAX,cronbach_valence_PR1,cronbach_valence_PR2,cronbach_valence_PR3,cronbach_valence_PR4,cronbach_valence_PR5,cronbach_valence_PRAX];
figure;
bar(x,valence_plot)
title("Valence")
ylabel('Cronbachs \alpha')
ylim([-0.5,1])
yticks(linspace(-0.5,1,16))
% legend(["S:self rating" + newline + "P:partner rating" + newline + "Ri:external rating i" ...
%     + newline + "RAgg:aggregated Ri"],'Location','northeast','NumColumns',4)
print(gcf,'valence_cronbach','-dpng')




% angry_aggregated = [angry_aggregated; zeros(max_height - height(angry_aggregated),1)];
% angry_partner = [angry_partner; zeros(max_height - height(angry_partner),1)];
% angry_self = [angry_self; zeros(max_height - height(angry_self),1)];
% angry_R1 = [angry_R1; zeros(max_height - height(angry_R1),1)];
% angry_R2 = [angry_R2; zeros(max_height - height(angry_R2),1)];
% angry_R3 = [angry_R3; zeros(max_height - height(angry_R3),1)];
% angry_R4 = [angry_R4; zeros(max_height - height(angry_R4),1)];
% angry_R5 = [angry_R5; zeros(max_height - height(angry_R5),1)];
% 
% arousal_aggregated = [arousal_aggregated; zeros(max_height - height(arousal_aggregated),1)];
% arousal_R1 = [arousal_R1; zeros(max_height - height(arousal_R1),1)];
% arousal_R2 = [arousal_R2; zeros(max_height - height(arousal_R2),1)];
% arousal_R3 = [arousal_R3; zeros(max_height - height(arousal_R3),1)];
% arousal_R4 = [arousal_R4; zeros(max_height - height(arousal_R4),1)];
% arousal_R5 = [arousal_R5; zeros(max_height - height(arousal_R5),1)];
% arousal_partner = [arousal_partner; zeros(max_height - height(arousal_partner),1)];
% arousal_self = [arousal_self; zeros(max_height - height(arousal_self),1)];
% 
% categorical_aggregated = [categorical_aggregated; -ones(max_height - height(categorical_aggregated),1)];
% categorical_partner = [categorical_partner; -ones(max_height - height(categorical_partner),1)];
% categorical_R1 = [categorical_R1; -ones(max_height - height(categorical_R1),1)];
% categorical_R2 = [categorical_R2; -ones(max_height - height(categorical_R2),1)];
% categorical_R3 = [categorical_R3; -ones(max_height - height(categorical_R3),1)];
% categorical_R4 = [categorical_R4; -ones(max_height - height(categorical_R4),1)];
% categorical_R5 = [categorical_R5; -ones(max_height - height(categorical_R5),1)];
% categorical_self = [categorical_self; -ones(max_height - height(categorical_self),1)];
% 
% cheerful_aggregated = [cheerful_aggregated; zeros(max_height - height(cheerful_aggregated),1)];
% cheerful_partner = [cheerful_partner; zeros(max_height - height(cheerful_partner),1)];
% cheerful_R1 = [cheerful_R1; zeros(max_height - height(cheerful_R1),1)];
% cheerful_R2 = [cheerful_R2; zeros(max_height - height(cheerful_R2),1)];
% cheerful_R3 = [cheerful_R3; zeros(max_height - height(cheerful_R3),1)];
% cheerful_R4 = [cheerful_R4; zeros(max_height - height(cheerful_R4),1)];
% cheerful_R5 = [cheerful_R5; zeros(max_height - height(cheerful_R5),1)];
% cheerful_self = [cheerful_self; zeros(max_height - height(cheerful_self),1)];
% 
% happy_aggregated = [happy_aggregated; zeros(max_height - height(happy_aggregated),1)];
% happy_partner = [happy_partner; zeros(max_height - height(happy_partner),1)];
% happy_R1 = [happy_R1; zeros(max_height - height(happy_R1),1)];
% happy_R2 = [happy_R2; zeros(max_height - height(happy_R2),1)];
% happy_R3 = [happy_R3; zeros(max_height - height(happy_R3),1)];
% happy_R4 = [happy_R4; zeros(max_height - height(happy_R4),1)];
% happy_R5 = [happy_R5; zeros(max_height - height(happy_R5),1)];
% happy_self = [happy_self; zeros(max_height - height(happy_self),1)];
% 
% nervous_aggregated = [nervous_aggregated; zeros(max_height - height(nervous_aggregated),1)];
% nervous_partner = [nervous_partner; zeros(max_height - height(nervous_partner),1)];
% nervous_R1 = [nervous_R1; zeros(max_height - height(nervous_R1),1)];
% nervous_R2 = [nervous_R2; zeros(max_height - height(nervous_R2),1)];
% nervous_R3 = [nervous_R3; zeros(max_height - height(nervous_R3),1)];
% nervous_R4 = [nervous_R4; zeros(max_height - height(nervous_R4),1)];
% nervous_R5 = [nervous_R5; zeros(max_height - height(nervous_R5),1)];
% nervous_self = [nervous_self; zeros(max_height - height(nervous_self),1)];
% 
% sad_aggregated = [sad_aggregated; zeros(max_height - height(sad_aggregated),1)];
% sad_partner = [sad_partner; zeros(max_height - height(sad_partner),1)];
% sad_R1 = [sad_R1; zeros(max_height - height(sad_R1),1)];
% sad_R2 = [sad_R2; zeros(max_height - height(sad_R2),1)];
% sad_R3 = [sad_R3; zeros(max_height - height(sad_R3),1)];
% sad_R4 = [sad_R4; zeros(max_height - height(sad_R4),1)];
% sad_R5 = [sad_R5; zeros(max_height - height(sad_R5),1)];
% sad_self = [sad_self; zeros(max_height - height(sad_self),1)];
% 
% valence_aggregated = [valence_aggregated; zeros(max_height - height(valence_aggregated),1)];
% valence_partner = [valence_partner; zeros(max_height - height(valence_partner),1)];
% valence_R1 = [valence_R1; zeros(max_height - height(valence_R1),1)];
% valence_R2 = [valence_R2; zeros(max_height - height(valence_R2),1)];
% valence_R3 = [valence_R3; zeros(max_height - height(valence_R3),1)];
% valence_R4 = [valence_R4; zeros(max_height - height(valence_R4),1)];
% valence_R5 = [valence_R5; zeros(max_height - height(valence_R5),1)];
% valence_self = [valence_self; zeros(max_height - height(valence_self),1)];





