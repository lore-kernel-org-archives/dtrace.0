Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AB12E1C6
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714571941; cv=fail; b=iYyEXKbz4AQukmVV0c7iAZ/64SeFXJTh3yELylZnwNMvGx2hHz4heQe01dbDEgP0j8rLB9FzRhAOAMn41ZcjkIxMzpzqIIr/fW6pcLDXeiekiFF8so3pLw248pmq5PHswoW0X3sXP/5DDnjlYILbAmQMViyxCUcflTb0KyVWxXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714571941; c=relaxed/simple;
	bh=ECH785qt1xeTfjAmxpe3Lp6RblyPMc5RULGoIkTkN2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iEuJyjnhO1t11/hhANAK9KEswNOb/FyDR9EzsGBY6J/5rDZsVKxR2lb2/1PuN9RVAVae3rlbJmhsHfZYiY2B868gIJGOzgrHXyOpIhVfAPElWW2G0oSgrTpzB5Ng1hlJ+d9LlozcDQ0u7zOtlIbhvgcdTuaKvE99KuiGKwte27c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G/MUSYvk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XXA124ME; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G/MUSYvk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XXA124ME"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441ARxO1022722
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 13:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=uBgiP6Bg2Bjz06ofTAdgE48EExy55G2JJlQowKm37MI=;
 b=G/MUSYvk3yT+4bZyshH/SOsn6hH6rC4TiUE5UGADYoqMsN+haTk6vfCAU6STvC0cpU2L
 B76hVv2UBSaFnKMlhuGozP2JlzRHDnudKf7a5SJhlGWLoDt+/yJM3uU0tMF2tFnpEvyJ
 1iU6wcFyReGgR294Iwx6VtyoyOFqEdijPErpeNyvliZEaDYwmQ206YOwOy3rmxlWv4vZ
 rjqcMJVK9UpxKFENVZJNgQYxzgh8eUVpV3WC3KZJcWwgZBKrkthOeLoVI83rHVIa15Dz
 sKSG1poaJSSPorYVqUVi0F3501ThSx9AT2b8nGTWhpc0Fx6VOhXc6JttgBSdaTCbrllo 5g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv77qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 13:58:58 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441Cef7k011403
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 13:58:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt9b6q5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 13:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfH6l3LH4bsEs35/uxUs+i9ej2BPtbhxWEJEa2kJz/1hqHvXdZVZalSYy2PwPb8JxohlzTwdnjztd/3zjxXGOAQ5DlK0dchoaZcV6ud9lVmUJgOZ1a2vHeaXLWjgcvYSTF/LJfTrUU7Ax2eHEP/XC7BhM1P7WT9dJo42nrC1Cxjz9B3u1oEQVp3/W/E71YHAgzEvCWS/8kZB4l0kbv7O+oz3VPr+QKd1AWbSYlc6pIz9SbGFVd5dDj5uK/vze374EiMAYllALT9iWVHvuypEBnEJRZLXmeeb+yIclF4n0j74LE7OAh1STNAo8C1oRW943TTij7JvcW551AaLGw7MuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBgiP6Bg2Bjz06ofTAdgE48EExy55G2JJlQowKm37MI=;
 b=R/BKVbRZHF9xjgWdyMww6RQv3Mk9gWe1GEzWoOlqhX3oPTEqq+nc+anPiMIZ0LLI1/n6WgBQC5+ly1H0FIg/iIG+tYnHgUdJnt2/7JGlBq97dJvCdVlJIgfHnHVIqvv3mVvavNRzPsNm40rYdC5WKCnLZA4qF0JX37Cr3hiDbSO/NsoONpnsIrpqwh73IH31AEJJzbR3YJCxH3bbcFqqaqAUMior80ATDnF+7q9UK8rJ28Go/GIPExEDwXMxPyHAiRhBBAwNcABxVL45FBYtasvPOEQuVR9Lj4d4/9bmz+n7dQMj+SFXKHHJX7iCHaA1VoFisI+hI3VkV80EVxe8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBgiP6Bg2Bjz06ofTAdgE48EExy55G2JJlQowKm37MI=;
 b=XXA124MECv5m4CrMLPx6xlsqDdjcZQQSc4NDxi2Py0dLQQDfG8K0wjgMSck+9DhR/HPRyOB/hvW0BDiTB7t7MMkIDGhNmnN6f+PATg6YQptfGruoaB2AjmnJvkme1zzFQsaN3hYGEt3xbg9q19jytUHaeIYJvPdwBD6qRBJr+hI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Wed, 1 May
 2024 13:58:41 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 13:58:41 +0000
Date: Wed, 1 May 2024 09:58:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
Subject: Re: Issue with stack) on 6.x kernels
Message-ID: <ZjJKjlD8EvNnmbhl@oracle.com>
References: <ZjGfUr/Zj/2taTAW@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjGfUr/Zj/2taTAW@oracle.com>
X-ClientProxiedBy: BL1PR13CA0403.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f783b3-7527-43f4-36f1-08dc69e6cee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ntJ2zOdsfphpiWFqvSAqHgDflcwZ2PbXsgoLma1oNP/alBEYlX19Snu388Ds?=
 =?us-ascii?Q?ibtaiX/GLpzqWxFY6nRMWGh/pumywZAyzLlYAak60tNmwDqwnqOeao67i68H?=
 =?us-ascii?Q?Yk1ErRhYWZd9MyaUmiVIaMcSQFIwKUnweFVjb1WLr9PlHnayAQKfjiDvtBlw?=
 =?us-ascii?Q?y4+nJyvGZXz0HAOJQZa8o0XAlQqt+jnAms0nRg/iE1fNt6lMjX9yOFqLYquo?=
 =?us-ascii?Q?Xb4rsD/N0LOpIenbXaLlUNkCDy50CkFXXP7GHKdzSEvBxdvuQJfkPQN7rqtP?=
 =?us-ascii?Q?KMSa7pH/i4evSEzYIub+7Rl4x914Exr6eq54bZKG5Zjgi9pNsYlMC0k8sJqQ?=
 =?us-ascii?Q?KtmO/ih7pzA1LRqg7TgLMnpJlaG4wwa73TwzTVgxFdNOce7inLr/bMQgKYgh?=
 =?us-ascii?Q?3iC+UuTmxCFrg7IHJAgvUUdOWJnimvT1WpXEYhRS7JV+rQ5+w854Ua7ulKab?=
 =?us-ascii?Q?OGK2iuzefwMfpM6QK1D1t2D1T3g8tLdFF8lIEEgJmwr66ho245V7DB0loTA8?=
 =?us-ascii?Q?lZiXEMSVf6LbLZENEMxryNxDDPmj35Q7kyEP8yIwM7yyiyzlgGCbOI4ANPVT?=
 =?us-ascii?Q?H3Sjt4bFVCC1FZqiKFtOyjVU/bMV8oAfNxnYzr2VLiceuN3X/SKgXIudp2ii?=
 =?us-ascii?Q?4MQDOXV71XpWgv7JBJZ7ZNQ5QcH/XCMWo1o2IaWTUTNSsYNu5YyY0znSIP6l?=
 =?us-ascii?Q?Bubb0YXKzSpCPjE/27PsEEpIxQA0ub6y7OODaxL0h5s6brShivKWPicqdWit?=
 =?us-ascii?Q?+iReyHDAFX4QbfUevM9JHlzKc6gIWIfDwroF1ht56wxam5WcZlZuJZ6e/E87?=
 =?us-ascii?Q?8bDMGkFmS3vJ5ozNydW0HZDNauEexvTzoYO5ffrWoiv0zai2d+j/Cwpxwu4W?=
 =?us-ascii?Q?eKBohH1FZ+5/YLP/l+4s8ZRjIz1zFClVipZoVK5FQDQEjH59Ntq5IPr3JzTS?=
 =?us-ascii?Q?bxYcefUZ9YW82B59g7u6tm/nOzXhmBRoiL2j5jNC5ak24PaUv4aD7s0dYZVo?=
 =?us-ascii?Q?QyVmyhpYmF9Bc0P/t5ZUG1kHY5ajpUPA/N7RZ6RibSFnKAv9LuZXQNBuQwXz?=
 =?us-ascii?Q?/ugRMfzxq7SnOyA+tVExwQ2bliOXt8K5vWD5iXK5L780QcnxwWZb/mu568mv?=
 =?us-ascii?Q?Twz/M+QCqujMgT2agZi7uvs1J1kKiaQerfqeXnJ0O9gM1DCXSdWKJRhfEsUQ?=
 =?us-ascii?Q?CmLXDKHqCOp/F1SiGRg8uQokzQr/Zgp+ybeQ7kPA5tQa1TYw/fYTVkZdU2WG?=
 =?us-ascii?Q?hZ1jafdAYnSK0WD+GtI4CcHYlSO1AnkWSnWGeASZxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?owj1wYykoZ5IwtX+zgNxZ+F3Kq9kCrAKuiAIIK8wM9NBtgLAFuwL8LN5cwh+?=
 =?us-ascii?Q?/tpn/IItfZCTYye/zZG6GGLn16dmsGj7mOsLcZBukUay4l5nz3Y2yNdAnt73?=
 =?us-ascii?Q?MkrJNyjCb3v7/WzuOc//4mSx2kLbv/EOeRVFgYoOL5N43AwG/0+y4ll4ABM0?=
 =?us-ascii?Q?h+V6bywbNeDL8HuQWB5sSQTPZkb1szfDRdkDWqYq8sm90ar6XBj9f8DsVHT2?=
 =?us-ascii?Q?SKvxQZUvu9npHU9Mo9151PJ3nRMwA/Tg9XMx2SMxdKa3x8I1VORGxADnSPO8?=
 =?us-ascii?Q?caWBY86WKs64ue2Z0zecVcGi+USgwHqY67JK6Wyif6xdN+TFWndmKlNhI7ww?=
 =?us-ascii?Q?J7Oc5TKZqfSgebLBQU5RILNyI3nsdPXZLUuwTwTV8CLsoN2Io+qX1BV++hRS?=
 =?us-ascii?Q?cYL0hdFlyavAeXTfXDTXhnpTKf5OHJmANzt6tNmJkJwfLfApD0wILzdFfdKY?=
 =?us-ascii?Q?NYhdnWPTVTgSbk9OCujGKUrPR/xsnpy9kXd4Py18QrKldPBvv8i8o6VJfwxB?=
 =?us-ascii?Q?ix/dlRTW9r0en+Yfyfi8a2IW568qSOpEwLmZf+sCXA4/W52UqkTQsHsirf1q?=
 =?us-ascii?Q?VJJuP9tfPrJkUxVUOo0bSpnP2760Sf3KzLNcg4fWd0SEYUHSuYcHY2/3Isxm?=
 =?us-ascii?Q?BxPnWoSmtYGIHLaJ5UAsviuHIkqtlW4LEzaovWVzNsFczOyyFQ9i6jB+qXy+?=
 =?us-ascii?Q?IXSrKwRTsvvxs8TcGODIa09jO31scTro+Fft/964NToM0EUe5UrgSukW/N3d?=
 =?us-ascii?Q?iY/YQ7P61fTC79lZt2nvrlr3poo2Y7NYGgl9bxEJ+lzTbPRxJrhTRavgHuOd?=
 =?us-ascii?Q?ZG/45X/ZB7f2De1+ASsPdXCCfwH40AVxmeYEPGVkJmGVt8d0GD68Is6ciPc2?=
 =?us-ascii?Q?jHxIwaAQ7jy4JLdLci4oe6lShjZLP8bkkmHti+JDoC4Xsqx3q6SzL5xypHgU?=
 =?us-ascii?Q?gjGhjGUU0MNMYMvXC7EHhR09savZGqetJi7NX6WP5sV1n6N5c9tknLnRVF5B?=
 =?us-ascii?Q?akgp5BsYoKUNu4bJXBWdixTkbmE2ywVJEp3ME6wf2yHfoVY4syGPQMTe5D2m?=
 =?us-ascii?Q?4UeCsdQw48B4z0HWEohTpuScZH+pJAT9QppXsk0sesqGPdTV/6VJAMkH4Ywt?=
 =?us-ascii?Q?FxegNfmqm48SXf8kam29N5tx2HzUt3PFWcVok4qDvsdhwTbRHDzWxOmd44Cx?=
 =?us-ascii?Q?ZNP6g2XS/l3cXRxNVUYHgwWkcJyF6lD6TCWQz39/qPTxMeu4s5fhFvuI+8eb?=
 =?us-ascii?Q?4ZyNtUsTK4oGY8odp0ObOO0GgBFf4GZB2JuJm+2P1W639awvWDhM+sYeekuI?=
 =?us-ascii?Q?7MImOO5TP+2XIHJVq4OHx/tGjN8vfnwxRoDOx8Gip/sbFg7ZwGCQbDGgyT2t?=
 =?us-ascii?Q?q63D9QCGoe5IDemVNzlnIwuvnZUMUswPzMtbpqQsUYyZbfM9JImeS47DcBC7?=
 =?us-ascii?Q?VXE/PeoMPTAWx01MAmi00JqShsdA/eku6W6mzJq1R2BXY+yLQOVSaQ+TmvjO?=
 =?us-ascii?Q?espSiNzp7ll3ysijLlVxYjWhfr6nYe4G6qM4POCH/X3UVxNds0U7cWnxFfOU?=
 =?us-ascii?Q?JNYI1z+iJSQS/mQvvCUVOtyAztAneBiFC/x8paZkG5ViowF7xOrTHhNx+/gF?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wtQW5+Zr5dT0YTYltWNXX7uhN4iZD0Y4lxBmdOk6bTNUWY89QqZbSlg4wTmbm/XqjrgRpKqBdxS4vnkR0aWAjhXAq0UUXV26nA/RrjhBfSayR1EI3AxvmQzoq7t7N5Ag8jVFmh2ABVjqWUZTC4T/Ft/1E6pwCVCto0jouHFyh4W+zvYCuMGfujhcsDC9vRs6C1NQTuY5UU+kNh+9CPiB1YTNBwUYsx+G9hBa3HDRJh99axviie1d3oaMXZ7ZGY9C3b7rywJWiKs2qpR7+UQfpB8jTdpO2NKh1ANpgMhZTjSky7XfBvIvN53vwmzWXfRQtUyDoo+cwlN4v+PKOyRLmYGluS/mlw+KYdmitTN+/AxEXRcM9xMoMj+7nqOmgaP+g0hlnV3P8hNbQNs472vdTty47stv0DxgFomiEhgKoMQyNExXH06uplqX+TUytRbd8fr2Un8firMx2JJ8x150YdPOFNSrtfEoGjkRVof+5jXCSFQ6vlyU8Qs6OB7FzGCAQ+vXTgIV4wr2e8vZWyczvCSSwBDY/JsOHJhsWfyy8M4lW/SwF2VWNUgZoIsO9BD1HT4Dg6wluyJiBzw2nXwsxl221ffPNcsphD4tOI6CHoY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f783b3-7527-43f4-36f1-08dc69e6cee9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 13:58:41.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHGdcO05zOq8r1aa91fsLDghaQ5QaycmG/n6XMRzafUrFdfD6WaXZ33EWVzYu90Xo0Ovttd/QKi9x/t+keA9pf4GpK2dtldD++wo1U224ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_13,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010097
X-Proofpoint-GUID: TTR2oHHqEJ4-heCfflrhsF-0xL_VvWDe
X-Proofpoint-ORIG-GUID: TTR2oHHqEJ4-heCfflrhsF-0xL_VvWDe

On Tue, Apr 30, 2024 at 09:48:02PM -0400, Kris Van Hees wrote:
> Newer 6.x kernels (I tried 6.5.0 and 6.8.0) seem to behave differently for
> stack() than e.g. 5,15,0,  Test test/unittest/aggs/tst.stack.d FAILs on those
> 6.x kernels whereas it passes on 5.15.0.  I am not sure yet why there is a
> difference, but Eugene, perhaps you can take a look into this?
> 
> 	Kris

Here is an example:

$ sudo ./build/run-dtrace -s test/unittest/aggs/tst.stack.d 
[sudo] password for kvanhees: 
  0xffffffffc0129e86                                
  0xffffffffc0129e86                                
  0xffffffffc0129e86                                

              0xffffffffc0130250
              0xffffffffc0130250
              0xffffffffc012b2bb
              0xffffffffc012b83c
              vmlinux`schedule+0x9

The strange thing is that it actually does give good results at times.

So I am not sure what is going on.
