Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B922B9DD
	for <dtrace@lists.linux.dev>; Wed, 10 Jul 2024 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720645901; cv=fail; b=ZrjWsUgKaqvCQN+CjdAvu55jlGY7LHo2hZ5ShVMdIuDC1HeFRUwvuhqk1IKydStuCka/dnEkE6tWlo+n7c/J8eyZRZxLOzz0tFLhN/K3b/uWCsno5WfRmI/Hik6qulzk79h1hE7GnlOYVgZqaAxM/rs918g85ELj4OyKMLr9500=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720645901; c=relaxed/simple;
	bh=n6KFqOgqKFc+vKBr1HL0uq2ZVHFdXnOpKKBjev+9ihg=;
	h=Date:To:From:Subject:Content-Type:Message-ID:MIME-Version; b=bfc9tQHS1qGgrFQN8/EVsB/ZyymuAWQn/vaWeuH8WLYalyjbKgQ2LSCSIK3bRUf4rmcNiyNJiHqkEI+b4jxi5YvphYJCsqcP4r+ZZEkqlu6HS2B63t9xq11TjKzhCatHuNZTh8k8zVvQ1Ci+gJ+cmDTd2i4i2eoRsrg8NOD/vk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FBdvk7Is; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zKZwLO9h; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FBdvk7Is";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zKZwLO9h"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AG6e7l017502
	for <dtrace@lists.linux.dev>; Wed, 10 Jul 2024 21:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:to:from:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=GvqFTLnDQ1iPro1UU+o21ed9L2oKnitPW15fgaEfnm4=; b=
	FBdvk7IsOKPr8V9V3MVQATXYEu20OXdfQew4D5j7KC2F0DY8UFGIO8BgiSKbSWLJ
	D4n2lenarMnKhVpzIg4rcZT+bl79ooH0yT/dwtFZLRfNDkC1kKaiw4HDbjK+fAY7
	Mu99KtnTwPxB0dyXu1DKO4haAGNDS1foTFkIKoZ7sJshXZLf7z+WxCoOkDY5JV/c
	baYGmKi3jND8Gv7LcTiHwRypJi667ak+Y9bwbpGTVrbl2yN7PWtBDcoq/W33o+q+
	J7hKPfvK1oL7279dYlzziXXKEn3LkJuhVzPipFjJUj4KzUsNY6WqXEhtSY3jDeiV
	OGAH+KJiqNnJEIpYFuXlKA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wybrc5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 10 Jul 2024 21:11:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46AKQwFK022734
	for <dtrace@lists.linux.dev>; Wed, 10 Jul 2024 21:11:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv1n4uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 10 Jul 2024 21:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpjHyaTqysRKJfoFldKWvrEFEANVsdbAIDGQW0DhB/nDFemiGIvzpUbncFAadlPNolUxxBiuYXxr4/TlsgIUR6nowZMaEKi+aRxhrUAcmSu/mY33Pz3xiEm3rS76UNfxKj111ywfEd6dYuNy0K466hQjZwiFrwsnYKlwunlh3yktZGVzBpCPmM0mOObFw97zeHiYx4/bzie+TMHQrmj1xXqxSAwSrqiAI1jyqzlo+mTu+SuduA9LnINgDb8bGBp0HANqR6lvUbIimS1vTOxwUQn1Aha1lXhpykUV7B0CUayicbywxhxbNYLxkRJZHTItjMsdqcaZMd1kktUZZz3pDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvqFTLnDQ1iPro1UU+o21ed9L2oKnitPW15fgaEfnm4=;
 b=IGrPredTuk9ZsRX41EiPX0TfW0vozAdE5BdCHD0oA5CIEtJY0f6vdEs+D039HlMaTFeTgyUlo3ZqQj6YSyvCSGSb+P64UnP62us6F5seEuvbtth3okNzmRO78FE7L2MtLez3++otD4J5LSw23h3rCiZ3cX3oGHccO4u7dVNTuZMuNL5Af5LHW2oaB5gZxJWibcuIoiB7IHDFNc/EfHAkbjQRmF7aHPocqX3bgJh9PyFbAUiQIpvXap5eF5ckq2Jeju0ng1MQLWfUbz2ifmV4DDhSo0kv12E+V9tdzZ5pUQ+ibtlTWty4kW1skCL9+z71xQSEiLL2YFk6oA7qGRe15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvqFTLnDQ1iPro1UU+o21ed9L2oKnitPW15fgaEfnm4=;
 b=zKZwLO9hEOAPU6/omoZ1Y9vixMFyWOZiDLFHbV1dTQyPmRlB683GPHOp84j3PwKbd6rDRncKTW1i8GVosgurNKxNNAzJUXbMogmOzgsCsa6cjEjP3RT9w7z8VFsXIRR7/gRBz1OJIV+cr4/IG3EMPIfInvfblxVv+kdAb2BNI48=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN7PR10MB6643.namprd10.prod.outlook.com (2603:10b6:806:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 21:11:31 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Wed, 10 Jul 2024
 21:11:31 +0000
Date: Wed, 10 Jul 2024 17:11:30 -0400
To: dtrace@lists.linux.dev
From: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [RELEASE] DTrace 2.0.1
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:208:238::7) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB62871A14DBE966A88646DFB2C2A42@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN7PR10MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 407653eb-7716-4f54-be56-08dca124df53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QALA7NPkrOBndB/srSlbNd6zhB+xJnCDX6zMLIPJ3rSWP3D9FYYca8g7mMQd?=
 =?us-ascii?Q?XoSa8W+TjIEPouWQ6aTSqhj23H4u8Mo3TVAnEcQOjDJxsuzofpjgITH2DGpv?=
 =?us-ascii?Q?3HkFDNob4Ow4Buh2X17oCE3Uf+F0VjHJ914BI2VVt2RAH8xvQiHXcsHSQoCS?=
 =?us-ascii?Q?fssQT037H4VE4BMfpUE1+U8veBh6KdescLyawEnrFEghoCIcfMVP2smJHoUZ?=
 =?us-ascii?Q?Gd3HbCB3BXiLQljXp8B8gUpFaSdPFbC01LgnTQiAJZxQyq2QluqjJQMgOZuH?=
 =?us-ascii?Q?JXPr9GQNg1W3Ivp5NBJIMjpwj2taOb2FoNdM7ZbQStLL15fpjjDwtN5zfP7D?=
 =?us-ascii?Q?JqfK0JwNTHp0gIPTrezFpMY2cM5tiG2jLcLMGxRMUAWx2EXJrWjed/ac30/X?=
 =?us-ascii?Q?h6G88iaHwy8+2++o5R5RQGE6O8iYYKDAbigcZAGZojT10RFstpLUkVT+HASv?=
 =?us-ascii?Q?9oqFeU6X3j5p0NWsV2PBRW13GIdCZVe2GJcdVJWq1xJhadkCdaVIULN47dwE?=
 =?us-ascii?Q?+dYSPgtRSpczQvTtsDliPTNJLaJFXikNuFS8JMMQ+WZmef4HFZRyhMjvnHG6?=
 =?us-ascii?Q?HmhmyyvCsdBVKHEDXhm85lDevRGEIptOew5k0mIt41SlGh+9G823jDZlHqBO?=
 =?us-ascii?Q?H1GSf3CYoA2WQa4aKp/70xDkJtF8LrulS0kQEcLQa6P3RpteywV9AY9RAwYZ?=
 =?us-ascii?Q?Qhe6yHaMVVQW/OrfoZa+83L35ikKwbg0k38OF3juvKhtvPeeFdSag06i71gS?=
 =?us-ascii?Q?r18XVwtI8FUsHpV5J5yksR8+kYm4xd4RoxglMkEXQj2kZA1+ji48hqNDbStp?=
 =?us-ascii?Q?i9u84J4YhdgGYmVgsXntpGiJfZ9ITEqxyvm/eeSeyZjR8Pl9hzY6LJZ1RLkF?=
 =?us-ascii?Q?a4VLp9cIQ3E1mTxjmT3IyHrW6X6WAbbkks8zr9mrg0tZ8KOfH1liTc0VOJTc?=
 =?us-ascii?Q?vdVP51YtB4JNvb6i9cSnnXkaUiE0/2myCgO+J1F/PHBuhv/nFiqIWR9yTYqy?=
 =?us-ascii?Q?s9xxyON6rZK4e31O68/QbSzoejWycSd0eDFG5j24wsQFjwUpRidWQcbxOFur?=
 =?us-ascii?Q?S5nN2ToUxIlj6/zodD262iSt+4KJOt36j/lRf8PF5AAEuqH8tNnnbc17SoZD?=
 =?us-ascii?Q?W0rNR5q4oarpEtQXcn3lnVXVIC16V6/EHs3XzZB1LcLzuKBP4iwsBPlOIDyc?=
 =?us-ascii?Q?PrkjV+3XKJoWBtYb15oZKU16y86gop7DMQr4hQ+NtEmtgEacKIhEk/nD2f9H?=
 =?us-ascii?Q?NL2xdxofKzb0Gzrjp0mkAn+cV1q4NWj02UdPh2khOCFvJ3G4LQAHvK1A7kGg?=
 =?us-ascii?Q?EbGOBMxTNdUMnGXJqgVWTSZo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kQlWiRT5pvipGV/m8M0i49C6iQsC7qjPkk3RRUGwZxKvxG7cJLXwq0TYq8FQ?=
 =?us-ascii?Q?gETVOpM205bxq2UbwW/Bsvj/OlJDNtW679l6UfY8c04FBE5xf5GT5krOmamf?=
 =?us-ascii?Q?1RiSYRtYL7BbjIvkGyNG6JZsW/41dDdpBmsMoJo/RcjRw9tYk8ZgT5Qq9RYf?=
 =?us-ascii?Q?Dk9PI+9ilH6bCXl+tAun3+LxnCnbec2EpH+oVhddFypjFwLONry+TITxj4y9?=
 =?us-ascii?Q?vGKSpc6mLNmOhcEUCM/01Lwe+3RcqnY6gSpdz7k5o/smINIZLIwLbVNtQ0F+?=
 =?us-ascii?Q?6ns51l4fPuJQ8m2jgjI+84gikXM+KONRfOKo4FJRTmnrLLqbIxiLUFk753Hb?=
 =?us-ascii?Q?8mQhVbsV5ft0zNmlf5Agv/mnOlTGcQagZb6HBFlpxmp6jOZsqLxVxDGTNf8d?=
 =?us-ascii?Q?Ha6VDMlxLmWwO2DwLISE8sgfJH74GO2ELez87Itgvr7H8nGAw99unrvYNLCv?=
 =?us-ascii?Q?99HvlWT/sArj1pRSruaHIZwPURvHUL3VA8TZplxOKKf044X/yutFoOqVzugu?=
 =?us-ascii?Q?wcGW1qePNKgRSYMemM/xcyFYN51OZxwqAyCjWsS80scEVB9uSoTMHi0Fu0Lu?=
 =?us-ascii?Q?Ca+i/36IZZt/uDw9rlWIrsPSl2PGi7tpt58UOek9QtpDoQpoOIIC4Eu5bCWt?=
 =?us-ascii?Q?IDupFLlzAIKcNSUVsG2LxhJqbKpGEWGI4H8kiTyD9wJ3Xwd7c5dkmKCb29DU?=
 =?us-ascii?Q?M5zwC8KUBhDs4QyczyHxh7nSvvffTkv/m3IeWf/VN7VAhZ2TZrMs0Sys9Xqo?=
 =?us-ascii?Q?Px/fGY248yKvcFQrrrV9zmIdSV56NdB95sld2nIyO9PWBfac+y/9DFGY6az2?=
 =?us-ascii?Q?OLGX9Rqf7RFc3ZOkJcjA5MXVz7hRfVnAhj5BjRtQyz/XNGKeT41VEuPJULL2?=
 =?us-ascii?Q?PPqfqx7L8rm4r/Cg/Cq9PApV4m1xov5Ychehfez8L53cxf/5qQlNMIzDYc7c?=
 =?us-ascii?Q?d5uDrM83GTbYJ+euuoQlEVdd7M6/bWyYqm+G+OFRU5boIP7xMAawio/11Jl5?=
 =?us-ascii?Q?0/29FGym+CmuWi21SE0lMlMeg4x2dkDqjnSdWFCjtW5vFb8jijuOPLjoxhx6?=
 =?us-ascii?Q?6OLk/HZF1ol0CHpYNTZVM+AKC88uiTY/c2thhAQ4sn7RbG4K3wlzY/507igQ?=
 =?us-ascii?Q?OqtA3aAsi9ntSBBDqtzxlyc3sNBZRgZT/f6MGhEZU2c2Sd0OHEF3/jA+CDzU?=
 =?us-ascii?Q?b5pCIEjR44Gru4uPtko6FrN9aB5/qlYIlDDvFkTLR8pirmWrq3RiImEtQEy4?=
 =?us-ascii?Q?5F9bzk9H54eqj57zE7+xuUKEX0qWNQgZpKY1CtRp0hAgIW7kAS0M9vcOxqD2?=
 =?us-ascii?Q?lyQy8BhAasLW+pYs8gWM1Ct7/mNnN4zAi1V9ph0jBo/I46a0YAIHLExXa3IM?=
 =?us-ascii?Q?U2yxUMzmP50EO4EqjCO4stN9OrnYOe9wzLHfKFcS2zeGPxhruRYR9GYYyxwB?=
 =?us-ascii?Q?UPizl2OK0h5pMzgpHuwWSCEKGNCY+t+LuAB+gKijgniqLF9m6Bt5fPfhdDSo?=
 =?us-ascii?Q?woDcxO/eFAuvbxP+a0JEqziTfrIkmH3ZsA0GoMXADlQQQXaVPkhfR7IZM88b?=
 =?us-ascii?Q?Dc3WMqKNcHurkBCgvurMdaHfr9R5A9B9748aPGdAlOeCkbI53p2a6FtsV06D?=
 =?us-ascii?Q?61kA9ONQaDgu30Cs2/mdKVI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fkmunamKs67t2hA0oEN6/t+vRCE5ecd4b5wEPtIivpQZvBiqH1u1ghplf52nSJMgpni5Dua7eKoNMUJfpG7NVTMdd2Yep89uIfjw1FrGZeqeb9iD11bpamfzXkjJriHOecIhn8TcWlo460E/BRYP/C0C7Fizi1WIWEfE3yPXTcLlwG5MkRQQHVZqZEXDT3nJw4DFalaK9pIPDvBpPvfQK0ewfVixZKM5uVnIHEb9LtOAHX0ikbjTSZHwLBivr9ImHPK8+6Ys4XG6rUvhWt3RE3GuWY/dQdc4ZFB+H7WllffyynoR2zQrdqfcuQjPDk9pVkxv10xTktfac0OPix7PTvsh+NCqBPgCwXT/zcD5/6+U06Ge93LKkiKccWPJoz6iunTxc40SvMddF7wTbBOyyhNQ+WrqVpTHH4t3PFcl3YxLgVYilAEYEYMmKMnkzmBN0WiSh3cUz6iPCAAv4FDkyTYWLRUVrvBfkyqhvVVPSqy8swWghcMt9jgxV1Oj7JIcpyd2eq9s1fiERML6ETNsQIGqBMNTjXfFV+tAljierRv2xYiMeogC+TNZq0zfIbjOrvcMrQSoof/FUeArhMyW+ijjEE+2pAUnGHBMqXmOkSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407653eb-7716-4f54-be56-08dca124df53
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 21:11:31.8397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FajG4xqkuOcUXO8JxLe3OyhsPV9W8cmFELwIcjZgTdasozOuQGbNVBSb4ouTOk/zXSu9Gqdev/fXK7aDLw6ZF0IXhqFhhYDTIk9BRDhurQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6643
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_15,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407100150
X-Proofpoint-GUID: IJwTlNDH85vzG3sIZEkUXQBKT2cG2ZCD
X-Proofpoint-ORIG-GUID: IJwTlNDH85vzG3sIZEkUXQBKT2cG2ZCD

We are happy to announce the availability of DTrace for Linux 2.0.1!

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for tracing
on any Linux kernel that provides BPF based tracing and BTF type data, although
(as mentioned below) improved functionality depends on two (optional) kernel
patches.

The functionality is close to being feature-complete in comparison with the
kernel module based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.1.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
      + lockstat: Locking realted probes
      + pid: Userspace function boundary tracing and offset-based instruction
             probes
      + proc: Process lifecycle related probes
      + profile: Timer-based profile-* and tick-* probes
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + sched: CPU scheduling probes [partial implementation]
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + sycall: System call entry and exit probes
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] fbt: fentry/fexit-based implementation where supported
      + [NEW] sdt: typed argument support where supported (using CTF or BTF)

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: clear, normalize, normalize, printa

  - Speculative tracing:
      + Functions: speculation, speculate, commit, and discard

  - Variables:
      + Global variables
      + Thread-Local Storage (TLS) variables
      + Clause-local variables
      + Associative arrays for global and TLS variables
      + Full support for NULL-strings
      + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, errno,
        execname, gid, id, pid, ppid, probefunc, probemod, probename,
        probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
        ustackdepth, walltimestamp

  - Actions:
      + exit, freopen, ftruncate, mod, print, printa, printf, raise, setopt,
        stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

  - Subroutines:
      + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
        copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
        htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
        mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, ntohl,
        ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
        rw_write_held, strchr, strjoin, strlen, strrchr, strstr, strtok, substr

  - Runtime features:
      + Reporting of drop-counters for trace data that could not be recorded
        for the principal buffer, aggregation buffers, and speculation buffers.
      + Pre-generated translator files to support kernels from 5.2 to current.

  - BPF support:
      + Direct compilation of D source code into BPF programs.
      + Efficient use of pre-compiled BPF functions for library functions.
      + A bpflog option to request the BPF verifier log for loaded programs.
      + BPF program linking of dynamically generated code and pre-compiled
        code to facilitate code sharing and code re-use.
      + Improved integrated disassembler for generated BPF code at the clause
        and program level (-S in combination with the new -xdisasm=# option).
      + Improved trace data buffer handling based on memory mapped perf event
        ring-buffers.
      + BTF type data support.

  - Development and debugging:
      + Support to run dtrace under valgrind.
      + Configure script based building is supported.
      + Improved support for building and using DTrace on upstream kernels.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
fully supported. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from 2 optional kernel features that are not commonly
available in Linux kernels:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - Module symbol address range data: this adds address range data about any
    built-in modules to allow for consistent ways to refer to probes by module
    and function (or probe) name.

DTrace for Linux can be used for tracing without these patches, albeit with
some limitations.

These additional support features for tracing are available at:

    https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.7

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

    Enjoy!
