Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5DF136E3F
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771085569; cv=fail; b=JjFzbiO053x5dUVNFlDDm9HrxaVz3bKCErhfiQFrnHFq6kugvc+gnPUX6vk/KpSuE8q/45OWECXIxBo8GkD9JGnzn7F8S6HRzmoTt5McesRmUuB2jaJCnuuo4Cj5yohzY3xy8AgKZTADUbVVSu1UuW08TPpY9gPMMV8m/Od4bRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771085569; c=relaxed/simple;
	bh=gikY+HUPdy/2IYP2Os4UOxQDkq8CL/mQ/aVCEQbn9hA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TivHSnKx+b5rRdEFe3xAzqj80wPz6ncGW9QTIBr19KxDpTVKwqCmj1485xD42JfvXg3NEt4p+q7/n7I+o/58UEdfuMaANeRG/YRjiuc1OgGNy4lpokuf2pxAvZvTG10roZrGc4cjirdJFA6b4MH154IJyFhU5GGjD9D9XHsWTts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mQZCO2/L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jaIUNXfq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mQZCO2/L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jaIUNXfq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EFidfw1380089
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 16:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0BVW2REUmT0fyidrcbOoULibTFh4asrgQeEzs6+kFds=; b=
	mQZCO2/LIbw8aiCU5OES+bh72IMfY4PEMOkPjWpQMndL/NTa/272aZ/brCjBLft5
	GsgqgUhW9Am3KHFBhiauLcL+Ib6r0LxWF8CGOmzsVpt6+3DE74GL2RsyxkyJKFrk
	V0dZCzkaBCGqX1bGla9cZMcKAeJBiVyI9Tdd3MVmlrm/pISjUyrtDyrSuDEuNxVP
	u3z30b6lUMIGqMhUsZEyoFGlUof2nuDiGOozJDsmHt9CRngG03pTclDS5E5SetaN
	OHzDD6MYRpx1fK33EbOLjbBbmQSeHKS8jAArrQ5n74e43mWJVdoyjk4d1pMW8NiD
	TxIlpWQds7s3KcthPSkHhA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0r88xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 16:12:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61EDcdKk023279
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 16:12:44 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cafg6pacs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 16:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu6m2JIwIkrKtrMXgn/OsElg+MDMtROZPO6HxYciyVVtLysJA6XgUjqq+6eWd74ELvkEtZ81IBU1K4XI9B6oBRh99+5A/Olj8yueG5xfumHIoViEzkOPi5TphUS6qFyAlDUrrFuflSaCEW2bUydEV4aqizLLwpSZZ65x72ZUT/tOeNUqmYcY5zEfIR0b6DDZdl7NAnDOcG4YvQViKVSiz3dHTPXAqCsyljXYV4dWi0ERSi5o5MZN8jC15lpe/CwF/VhHJ5Z12uprkQoSwMdHXQ28CMYSY61HhkeneY9GTPR+PL1dqYAWXacG/PTJwE4V6aOKxbEIdFohE+I2LnCnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BVW2REUmT0fyidrcbOoULibTFh4asrgQeEzs6+kFds=;
 b=yXQwN7Id3OHVX9MpyUT3qy3+cPdMftEZmKZcu4ve9ELfCq/9bs5lB5G7F6oS6zVWtbAZ7+HgfYNap+noyzCgj3k3xvsaXvH50+7CaVBaxYJwyZWDYKfmS/qdQLrmN9IdlRN4IsBamktGKkJUrhAVXpYj+q/Cbsu6cVMO8oassp+hcU+I/29zAoJ8uaT5TegA0XfwJhpIGIZOCMqDC7suW/0ltBOASpTMn9bpu9czd9HGuMy/6Zmg9dU9Sdjc5CEwO18yg31Il2+LlBBiiYKAF1nUUA26gTPZxMxJwe9Qf+MVTdYqXWlHyrTQVaJs0z8fOdAXZrMFcDX/cZIwnfnltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BVW2REUmT0fyidrcbOoULibTFh4asrgQeEzs6+kFds=;
 b=jaIUNXfqheh06Y/JiFZGSBzqugXwliFMFlSYySJET6i9RP9VFPzLAPJRF2HP9mBp2A7SEeNW7MIVY3DmxnKnK68Aacxh3522U+c7f+aGyOSwiaTn8ZFvkMpsxg7LtdESX8Vo1lgqy4QOH94pbShK7sSspEljzrlN8QtnRKQXiM4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MW5PR10MB5852.namprd10.prod.outlook.com (2603:10b6:303:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 16:12:40 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 16:12:39 +0000
Date: Sat, 14 Feb 2026 11:12:38 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Adjust paths for common executables
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522EA3A65016555DA0EBC33C26EA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MW5PR10MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea3ddcb-62e0-4ad0-d930-08de6be3e03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JARBMVuqW22pGsFRaL1JIQQ2wguF+V/nQXUiwGsEVpxgGjTrEOWfM9xCveoq?=
 =?us-ascii?Q?nCiuhjZFw7IKEz/aeHOqg+n9V9+UkcCvonAOXvEZSTb8WCuv/R9W+MIY9w4d?=
 =?us-ascii?Q?wkCbYQfAjXUX8vjGUYFtgJ1ejF7PZ058fAXuW4RWf9KI9gXhSUFX6/LL9d1i?=
 =?us-ascii?Q?ZguNWkx7wHBFVnCGrEdQ7FhO4EtR0JM+6ycruYcfhvgTFzphGL4gRdXZVp51?=
 =?us-ascii?Q?MM2cijtSguf/jvkxxHZTSt/S6RxE6Qe4F5WCnNMwebRVpz85hS4eIvHfaPJQ?=
 =?us-ascii?Q?KXoLT8AEa3GcqTZ/OJl/bsEREqomwv+jrjXBbDj1qTn9QAn6OsVWJbY8SJzn?=
 =?us-ascii?Q?qUSuyT1jJSOvGppYYSLKHUDN0VKw/cuMOBOYzZzti2AZTUoo5zToNHZ+MOKH?=
 =?us-ascii?Q?5hnhLG75hLdUAMq8t4gi7gydToRCdiTjQDCLzoYfHMzEWzjMs82r/XYR2IpU?=
 =?us-ascii?Q?sVDP1Q+fmloFkTdAswJ1aEMIeL8YQmvZ2qtLSgXy1hpGc3RdjQCkjNqINSmY?=
 =?us-ascii?Q?1PWMqJnGyE4pcOh5UQu79KxxvBVK/vvX53yUShGKlZof7n2ey8HDbnafn/BV?=
 =?us-ascii?Q?X+spePa3kHp7t2HD2s3tCnPbOlxfova5vYyEcQTyIPJ/RKjrlpUSHMcCpeyJ?=
 =?us-ascii?Q?R7nEjK+JRzZuD7IoggpFQRMAGd9cJpxkZuND06MVNvwGl7q0kt9fOTM61KbS?=
 =?us-ascii?Q?39HLR/yPOq215AJRQ7fPAAqdI+eUpdKT+SaGjGb4vfStA8XVuILh2TTKbaCy?=
 =?us-ascii?Q?HzUx1V9txVJdw5cIa10aTi7qJc876aiXy8p4LLk8868eGxEittVvC0I5oTiy?=
 =?us-ascii?Q?q2mPFyKieYdLqlz8zNZw0kJfpdBxHzIhbfCVxQDIy0wBFWw5jaZi3bcrwGhy?=
 =?us-ascii?Q?w34z2gjn4NdInMOImgchbREDqQSsc/J6MAQqHP0Iqmr6kAHiAREeLXyN3eCl?=
 =?us-ascii?Q?7NIzB8970YLSODSf+//bBDtuvmLd8l9eq4UFUpqi8zjuLSCs7eqvZcjvdmYY?=
 =?us-ascii?Q?2H9FOV+Cr1FF4MCouB/jn0uQu2acdcWT/eRv80WedNSf7BdzGzw55vXcGVG8?=
 =?us-ascii?Q?VVUEEFnaobDsYWYUiO/cH6LpR7ljJIz/EydmkPOQC+RFiIRWoqssqE/MBd6m?=
 =?us-ascii?Q?diELBScWLlrmNnpQ70FSsnmWCgDlEPf73TuwpU+R0/t30wrrp/HL0ojucdnA?=
 =?us-ascii?Q?toph4eT5Uw10+vuoRncJd+LL0t9b9oEj/DDYqsj9SasumS4NGdA6CkCUdnDP?=
 =?us-ascii?Q?GsrK5/BMuVxXifWHsoUKmFdv1p4zyAXHVuxVL2EeF5l9eUb8qUQJRDDoYbYK?=
 =?us-ascii?Q?q7kzDz2+v9e7VMTkAtjF/eeC/TRZdfz/ViVPicaZBDHpFPW4uWBupYBpIKG0?=
 =?us-ascii?Q?VOCfoxIMOCFOK3n6V3m47xgob2qoBuHZIdwLfn3dGsKr1VFBw/nxylYh9R6+?=
 =?us-ascii?Q?ffxJG1uG67bBOPdOo6+JhmhjT4eDv4QSC7qsaVDY7Rn27KzpuP344plhxtaC?=
 =?us-ascii?Q?a/wLNDq4j38pXoIkWAR5FYfeLeO32dPGa05FtPkT0XWmNA7GjoUYQio7Z48i?=
 =?us-ascii?Q?ukYlljxLa7jVOm07pOM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YqaXSBqlCuBut42EvWg9VqdS9Rc0Z9Lh+FLRUmaA8lPEIqVTy+Oey7H80CiH?=
 =?us-ascii?Q?3HavuiuLlN53LFFhThAcqRdK6WmWP0twLA9rNUXYBlJAOhFrHE1ADaND7rW7?=
 =?us-ascii?Q?OhUWbCqlD580MIPZyOPj8vXhhrlKHOeDDSXekyLI1prCP72Rf8so107+baiv?=
 =?us-ascii?Q?YLMhN9i2wG5kzf7lKN/iGEBmuRA1PHnfS1ZMzRMCTys86UlSH0HdqQ0ONEs3?=
 =?us-ascii?Q?cYzl+zdybUHeH0O8Qn3oKrp+eRRGhvotbP/sU08vLnnofvO+Z++VEJp480jo?=
 =?us-ascii?Q?raLs+T/q7vQIEhhRY4EBkuFe+hXNas7x79yyr1M8L4D6s167PmhLay0OGoKO?=
 =?us-ascii?Q?XPm572GF2wS2h49KvDzXT9PbgAuB5B9SA+gwxkJPklHVjv80JhwIpcsfvLlc?=
 =?us-ascii?Q?fS1KRwaS/jnyUs/+dosLH+DU5iCNH8LWAltxgJZeltb593PS0HCTxhssqxAF?=
 =?us-ascii?Q?sul5uvkTDIHWmvGn5LI2NZDrZqH5lm7W5laaanBVOjB988Q6Rn6gnbQRt9/s?=
 =?us-ascii?Q?+Ag2Ar5Q7kzAFfqwqQNFHPraJMtKysYFIjKXZWJPsviJjKlYORueMap8JXJq?=
 =?us-ascii?Q?oWoqwDaHQCY4T5JOzbMSOruk6RyTEp+ZjZF9R27mKXLlQLUO+kT13sY72ENs?=
 =?us-ascii?Q?3J9FVhuuq2GGllAR74wQB9acp/ishFNITOLg8WK3IJApgFNjAyB//HPxXp5C?=
 =?us-ascii?Q?Ngf0fpUqtCOqfpvrh6ahboOPC/LGEu6UHjMo9AC+RUC9JrzO9sb/IpwvdV34?=
 =?us-ascii?Q?5agELeWY3Kyb3uf4ThApjSt12LClGywPL9l6uV7lMVC/sSkSbjxcRDIumT1s?=
 =?us-ascii?Q?23qv16r5VCgmo9pk240G4vBnXB+wCrYTqnRap/9dhsRgXftKpwGpMdz2wUxb?=
 =?us-ascii?Q?bOL+bbbop+24N6gscdm1zlAfjNpFCEdBPK4lov526uDDK5DXseP51kto6AYi?=
 =?us-ascii?Q?fYBIQOjKU8/lFyB/MwX4bRi47PVUIzVjm74dPUHw+0i37pmlXz5wi4CY6NCg?=
 =?us-ascii?Q?lEhYN1M4pdeKBfGWREbYC5lG8pp/254+Iipx0rXRrTDWgNms9349RNkbj4xh?=
 =?us-ascii?Q?qILUq2BmUHK9jIbzyDum/whszUgPaINYvQhDlVbt6lVVZE7cCPko7pKabCcW?=
 =?us-ascii?Q?9XvTSMrM8xfIBs2YrjhcRHMfhvRWz8sepr3x1UfHNhYeRjuAcuKMP0A36/dt?=
 =?us-ascii?Q?fFQWEK6enbneLHuPFwQsFGmkKEyHmlgNj03U3VFJc1c+N3f1BclXyqdANOWO?=
 =?us-ascii?Q?GILEmk7PgpoQYENL2zDyZgp3PHJUK00WIxJ08pxnXD2jjnufp7zCPeUt9ROW?=
 =?us-ascii?Q?lfSlOHXbMPTI6ES/SgHGmeFiPjWyzh/SWh/wIJ17JBthr7ervEc5IZhCR2k2?=
 =?us-ascii?Q?DRuz6AOfNelikbPrLtHHHi+2DqeYiBTgv3YcWD20KED8Nh61yDyB/49hcYWk?=
 =?us-ascii?Q?P2SHR0X5BeYCM4kCgNtUEpYpgZjDD8JS3Ol5bMeJLuiO7rz1Rp9+UZtt/S06?=
 =?us-ascii?Q?suBUsfJCh30SUbjl0AdNnOj/cgZjAJeoPMW4a13VIs6zXvkrdbIbi1qwD5lH?=
 =?us-ascii?Q?M14RO9eKWPPAceFQ274zEvOTimE0mRTGt9EoSGfib0inClBv7R1VwbCbSxV+?=
 =?us-ascii?Q?YYV0wHMvFI3qKdwq6gBSKO8ddi5s+WMHyjoJXleJ1nrGsVzUBbizeDqjpgUx?=
 =?us-ascii?Q?YZ7rGJVPQPr7NcsETxBwKnBotqFLh64Q7PEG/5Ijc0hjHU+j3VJt7ZqdkV3M?=
 =?us-ascii?Q?eyNJbD9NHQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Uf2kp21xnPysZzcU+GUHQ0VdEboaGkZhirLUUOoWi1joHD3/DB3L2bT78Xosa+Hyt6JXthmoGuOTMcagUahLOKxVzrMTD3mT1rhYI+ALXLa5oJMJcedD+8BHeK7U1i4IJVjXfd0o33xkwWbWCw1bNQT7BqGiUoVqxyTJ1KX8+xfyUx6bC3I1rVhhY1ShDiTCOwFyBJdXhSP9aGbDa8GM5iuqNDVVMW/fXnISTqIzxkZWsMWA1f3zcM4Be+5CNFxflxk3JfrfXQQoVGGRf5KVP8j+m/dXJbAmH+upraH4NucVNlKoseeLCYmzLc+oZOHKirD49g2NGbTkF6IhZ9zpxKH90cVS5w8Ippo1HDycrMv2dtrtzgWuTdOSxs+YxZE1Xd9xTlUCRvuKTg3D1OfHI/WxoD6xcoOhellD40bNaeFdL2k2kHX7YjbvruzZldAjQEbGjJGaF3k0U0wtKnIUk/lTOh06WF276/eV8LhsDlKMvCoIZz3wQITSLvT2zRQi/4kquJyD5TYQcEZ1tV/xwQbvp+oYqAhb+pnHOaDCwEipIvWmPMbSiuaEE8+uRZkd/rRUS2FRYFzn6+rolDYzE4cYkR6qTD/2q4POrZ5SchQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea3ddcb-62e0-4ad0-d930-08de6be3e03e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 16:12:39.8566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9R1RCJHtZcPKGVJB9/1KmQdUiC/U4bgho9f0rcOAF6Qm2r7zXvssliY6t4/jaxmdWUZdrDUGlYIAAsb/04R/JHOXWN3dSegEmUkIgtJfbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_02,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602140133
X-Authority-Analysis: v=2.4 cv=V6RwEOni c=1 sm=1 tr=0 ts=69909efd cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=JjpDHwIWTM0wTOXiwOAA:9
 a=3ZKOabzyN94A:10
X-Proofpoint-ORIG-GUID: zp-446_Fv1V0bUqVx_wGA_8-H5KjDx68
X-Proofpoint-GUID: zp-446_Fv1V0bUqVx_wGA_8-H5KjDx68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEzMyBTYWx0ZWRfXxOklDk15q0L4
 /zraNyK4O3vxAfgHU8PFP9AfrJaIO4QW/iHyDYMen5M/1T4iVZLmu3os7A0ig6Qy89tvy5+sSSq
 wM2PN4wbjmRZOgjsq3iv5vOUioRsjCZ2x4sw6qhjJSJWgAKbQVdlr9ViwSlgULpVmSYVpaMgFrv
 NlJ8S7ewrZxBQq1Ll7pERnMQU7oVKfaGBO2PTDl76x67t5Q5q4y7IOrPLjyDChLdCINir6P4BR+
 P/vRe6FFSCVqP9vcroP5H7efbfjEjscLShJ+MZ6p56HT1lIzYqGyXuaagHZrPCGYrxXb7Mjzxf0
 lFjNdOJ2kTyO60GQCJk7nlYlHEwHSZErsbCb0BbZzm3qnD1ImNODEMXKx+8CNCdCZmCKpilpgW9
 6WQdLidcAJc/y3LvlxtmERCEoBuqDPWLOXPxSZ5mYkXVkeR/m4OlXYDzFJ7R4yW4izeeI2U8vxw
 G4nTtn8Dwh+6AYd64+A==

Favour /bin/* over /usr/bin/* for things like bash and sed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x | 2 +-
 test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x  | 2 +-
 test/unittest/codegen/err.deref_0.r.p                     | 2 +-
 test/unittest/codegen/err.deref_1.r.p                     | 2 +-
 test/unittest/codegen/err.deref_i0.r.p                    | 2 +-
 test/unittest/codegen/err.deref_i1.r.p                    | 2 +-
 test/unittest/codegen/err.deref_string-assoc.r.p          | 2 +-
 test/unittest/codegen/err.deref_string-gvar.r.p           | 2 +-
 test/unittest/codegen/err.deref_string-lvar.r.p           | 2 +-
 test/unittest/codegen/err.deref_string-tvar.r.p           | 2 +-
 test/unittest/preprocessor/err.ifdefincomp.r.p            | 2 +-
 test/unittest/preprocessor/err.incompelse.r.p             | 2 +-
 test/utils/clean_probes.sh                                | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
index 627beb32..8d60c971 100755
--- a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
+++ b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
@@ -1,4 +1,4 @@
-#!/usr/bin/bash
+#!/bin/bash
 
 [ `uname -m` = "aarch64" ] && exit 0
 exit 2
diff --git a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
index 12759d64..975b71f6 100755
--- a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
+++ b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
@@ -1,4 +1,4 @@
-#!/usr/bin/bash
+#!/bin/bash
 
 [ `uname -m` = "x86_64" ] && exit 0
 exit 2
diff --git a/test/unittest/codegen/err.deref_0.r.p b/test/unittest/codegen/err.deref_0.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_0.r.p
+++ b/test/unittest/codegen/err.deref_0.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_1.r.p b/test/unittest/codegen/err.deref_1.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_1.r.p
+++ b/test/unittest/codegen/err.deref_1.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_i0.r.p b/test/unittest/codegen/err.deref_i0.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_i0.r.p
+++ b/test/unittest/codegen/err.deref_i0.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_i1.r.p b/test/unittest/codegen/err.deref_i1.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_i1.r.p
+++ b/test/unittest/codegen/err.deref_i1.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_string-assoc.r.p b/test/unittest/codegen/err.deref_string-assoc.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_string-assoc.r.p
+++ b/test/unittest/codegen/err.deref_string-assoc.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_string-gvar.r.p b/test/unittest/codegen/err.deref_string-gvar.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_string-gvar.r.p
+++ b/test/unittest/codegen/err.deref_string-gvar.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_string-lvar.r.p b/test/unittest/codegen/err.deref_string-lvar.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_string-lvar.r.p
+++ b/test/unittest/codegen/err.deref_string-lvar.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/codegen/err.deref_string-tvar.r.p b/test/unittest/codegen/err.deref_string-tvar.r.p
index 68ebc99b..f7dd7d99 100755
--- a/test/unittest/codegen/err.deref_string-tvar.r.p
+++ b/test/unittest/codegen/err.deref_string-tvar.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 
 # runtest.sh looks for "0x" to filter out pointer values.
 # Strip the 0x so that the illegal address will not be filtered out;
diff --git a/test/unittest/preprocessor/err.ifdefincomp.r.p b/test/unittest/preprocessor/err.ifdefincomp.r.p
index 7629ac59..68cbfdbb 100755
--- a/test/unittest/preprocessor/err.ifdefincomp.r.p
+++ b/test/unittest/preprocessor/err.ifdefincomp.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
 # supported, we have to sed it back again.
 s,[‘’],",g
diff --git a/test/unittest/preprocessor/err.incompelse.r.p b/test/unittest/preprocessor/err.incompelse.r.p
index ae9a6833..64ecab97 100755
--- a/test/unittest/preprocessor/err.incompelse.r.p
+++ b/test/unittest/preprocessor/err.incompelse.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -f
+#!/bin/sed -f
 # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
 # supported, we have to sed it back again.
 s,[‘’],,g
diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
index 16052cbc..6cc176a4 100755
--- a/test/utils/clean_probes.sh
+++ b/test/utils/clean_probes.sh
@@ -1,4 +1,4 @@
-#!/usr/bin/bash
+#!/bin/bash
 
 TRACEFS=/sys/kernel/debug/tracing
 EVENTS=${TRACEFS}/available_events
-- 
2.51.0

