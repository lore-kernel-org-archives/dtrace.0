Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1738733987
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738119389; cv=fail; b=oKQzKa0qKKcdKVOqNhrSIEEX+5lruiuUY1+0cMDuLqgIrCH+iyP7nj4yqod1Cn+IoESolbAGf9XKcNHVSFk5f4WmlL5sdXfvas+AGTbIQ6XumK4aFK8/+8ou0fxqJohkAIRKSoi6Qbf0ZcHKKs9fgAcrnhrMU9VQ2RCCpHCHnbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738119389; c=relaxed/simple;
	bh=XNde+8tMtC4oQ62OO/AFDY7ZzpuAHeetbmDIFzQDjSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f5E2w5SLGoGyU5xa1wNGb5aA8lZhtJNT6QTI7PRr9VwnXw51H/W0kx/cO+7DN4UJhXVwJM2hlkKoHd1Z+H1Xcbz1gwZfvU2N6K9o5g9T9wm7Z0En23FMnHvWdYWBe97py/bUYpH953tKOfjBUq1xSuM8iNbM8LvsFrCJ2fcG5is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fp9x9EvA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RjFasLZ8 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fp9x9EvA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RjFasLZ8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2Hi12007586
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 02:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=rFwGb23xPBoSb3kvjK19zUm36T2FmiwEHnRRRYD+Vgs=; b=
	Fp9x9EvAfXF6trYg4KVhZ3uK/MyP+G9BpUsEOH42qcOJoJoNUeyIBIq3cIJjjNMq
	jno+lEvNAQPbGPDFtFkdKCp+82LDedWYA9ZOmTEUyCClI1/oEfbxFJOyfMgkzOhW
	o2B5/Va/dZDvWCKqPEaNctrmEI64IOqI7XFkWjlsCPfl2GzdRQ+98SPddw8YdPLl
	Zswm0xkVzgPTt3XJGgFhbrW7reY3LQXcyYq89Dq3kVT/7QRjmcuZvp8VBvQ4yCbX
	UrbiBugVV97lgfTOV9U9OezZ2PLRF+83uF2zH2NUpLsdMVsQkWMGuZNplLQbGLn7
	JrQgjhzUyBuqMCkm1w1oPA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fbdf00yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 02:56:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50T06KW1023934
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 02:56:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd96kba-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 02:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpYudCriGuDnJU+hMmXLsHyOCrIPRz7weoaa4J5F/MzXZuOQ4UgD9cGuyMZsPj0CiT+diyxpXGG9TXS+whsfMX3NMucH4MFXdhFe4NLZEBLsoKnhJipTDV/UJHyXNFUJzj4xsh/YjW25KY1bk3tV1wK24WozK6UwfPjjdZU0WTgIavRPv2Kh6GAC8jNT2lGN70rOtUwaIw58kf8QEGXHjHsaxlU1SuugrecnQwBrYOxWCK1Va500jdFN2RI5wPPmHrJCXwZ/P2EMVjw6lQQZ+4UIR/QETUm5YxlNA3qxQ2QAFzZKzG3kvj9PCkzSpPiYDvHqts2plnLPnCJzHlAxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4n4ETbrs8n+Ah+UpTb4OueILVtsJvDwtUY555w7JYc=;
 b=T1u1wWx5sxrK/2jn8it+v5vFhcwjJuZwMMfB8M861D8Ojg/u/r0ErN7Nf3PEotEt+S+5t0dboEJNlvMSsyPr3+HFmvIfoWsK6IxclW9HpQGwJDkEay8XWtvY4oDMlc4tKWDpLSu1x7bIx8E7Oyb6MtAGd2WtV1T1bKYnRPrdDgnRNo9HJSaiVsQ/2W7zinDMTrVkT1dEMh6EgPIYMKmi0VGi7+wUY+qO+nUH2u2n1bBqX4CYVf/KvKlX5An+YYvIfAIOMAf7t1rR1nH61S0F8uEIx0rkGay39EhwK2cMoatyHilgZwEUXSPp1AZRJs09xdrMJIqEaXk/bg+FGDcK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4n4ETbrs8n+Ah+UpTb4OueILVtsJvDwtUY555w7JYc=;
 b=RjFasLZ8xwpir87ltZf+GwSo2rAzYFVJcFGYp4ykY/JHZlL3X4CQCyN8rHHntN+Eae01rmaBjEaOLODjbyH4MPXJfHfG/RWFBw7Wbg9hHAZhvbA0SYVMLBSU3A1jNcMqVf5Z+ZM2AE54NKMBJfyXqy7OlsueUyReFM2KcTNBVI0=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS0PR10MB6994.namprd10.prod.outlook.com (2603:10b6:8:151::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Wed, 29 Jan
 2025 02:56:22 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 02:56:20 +0000
Date: Tue, 28 Jan 2025 21:56:17 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] procfs: add 'execargs' global variable as inline
Message-ID: <Z5mY0VUgun8jSNq/@oracle.com>
References: <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <9164adb5-a6b1-a7ff-530c-6aa30fa57be3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9164adb5-a6b1-a7ff-530c-6aa30fa57be3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS0PR10MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b21120b-50a1-4c3d-3282-08dd4010822d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ANIeCq+acUWCZqNHF+S/nne7wFnaUFe+JBnfuhFzZKrmIgH2QIZDVIHIbW?=
 =?iso-8859-1?Q?BNN89M7S2ks2bQDNkf8k9TNz2S4p86JzziNPTazB7/LyBKZA0cuZ4j2dM1?=
 =?iso-8859-1?Q?U3AFLX1fpiuHzUSwcVlSywWpLejfOix7oNYPJ7PGqwCtVE4VJR2usjeQMl?=
 =?iso-8859-1?Q?qVqada9OczlKew5opX+XwEeM20399YegzbjRYHpUOpqjLMBE4B/9+eu0XD?=
 =?iso-8859-1?Q?Rjk8WV7h3WLNwyjFS2I7R+1zhvGv1GaRwBdQ6mloKOXaMcYl8MQnLx2r3v?=
 =?iso-8859-1?Q?6ONyz01D/GvBGEe425P4/PChZ/FA0/zcZSpFouZ13+tqvK4K+L8Aepj4TS?=
 =?iso-8859-1?Q?gxEdNNSV39vMxbNLEGO7nG5Ow2+GM8J68BD9YNs6r5yW6a32CZyUzq2XsH?=
 =?iso-8859-1?Q?hDJ7WG04VsoRseI6RPDiy0VIYUk2KHWyITQ4KCtHJd8Yjigvoy/HOX4aKG?=
 =?iso-8859-1?Q?g7XBN6TE5l9bm0XpcPmwvuduxHiNRpbEwKGTTPiJ7o/QvM3NoYThjvAPxX?=
 =?iso-8859-1?Q?05GLd4KarYb2lwDQUcZ6E/TMwh2WGfw7zMXG1hqx1QPsXHEhXbKpWPuFbn?=
 =?iso-8859-1?Q?3oMVFts9yy9P+iHzlN9bO7plaMbuUvlDrAcp3138/AERw7RZ1pIKCMc5zI?=
 =?iso-8859-1?Q?0F08v+rurrX02f3/EH94lcpI1i/DF+eu+p3HuLtZGZpt1GRQ4Rvje8ioUi?=
 =?iso-8859-1?Q?C3l/BVLbuCYNC5+tkRhF4AE6mYMYPSlsn66ugxvmJcUAjdEznPq0a7uEGC?=
 =?iso-8859-1?Q?NhRz859XVMpvzs2lfpU4Xh4vw/eq85eM6shFdDgkEjXu8n5chPFmTqLZgm?=
 =?iso-8859-1?Q?pZhkk239PVVl3LTbdocJCrpvR2D3UcRkMsyVs+PFKZWdGwW6eAbNyjkZ+c?=
 =?iso-8859-1?Q?tI7MlpoZU4EqY7TFH+5M804Dz9L185NqRko+dL1Smb2Op4QvmSiM89zOhT?=
 =?iso-8859-1?Q?8BorlQbA6n4xtFGidsRVI8GsB/VR2TOoCrdgCHNq9aQDDIpESG+DZYiq6v?=
 =?iso-8859-1?Q?A++FBtUjBEU5yJZkmwN8EEy+5+uCjjvhcb6BYjBQhSRItZjbIVXa33amKK?=
 =?iso-8859-1?Q?AeOZ9/LXsE4B4ySl3zAfHvqPVTqytBh7ow0AFaydAAOjn0uhCWoUl0GBPC?=
 =?iso-8859-1?Q?17Z6PRB/OhX7WytA3fr92U3yi7tADyZs6HvyfRQTLLbO0i9x+a7GGYy8i5?=
 =?iso-8859-1?Q?3dQwSDpSD7tjHBAIP7ny/Rhg5G/5yhNuqOhZVRAxgWZwwRZFu5CK4VilQk?=
 =?iso-8859-1?Q?65GHER0Ocy3q23laqkxw5XlY+rurwIG/8TmxLkz9MibcLxehT8qWpPpN8n?=
 =?iso-8859-1?Q?ccGlMiZ3NqQ/0TltJFs6Sgwgdnc1sxekXe+tiTGHcYwlPUm7CME4FM8Ekz?=
 =?iso-8859-1?Q?EUQ2/c0gn9ptCccqxO+4ToxIDMW9UMU+N//qraeIPnGyZgz1ZU4Z3CSUqG?=
 =?iso-8859-1?Q?EjK+VGOTyMaFLua0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?rbtkTxwonbtCkh5zLVopUIQUiGYsJsKR0YbNXHOQBeW/pnNxpsc9s5yQLh?=
 =?iso-8859-1?Q?yTb3fCjsVEUab0fb8+EFv+6+gOh/+SrXb4KDtegrGf8QDwut2dY/eGS8c/?=
 =?iso-8859-1?Q?3SJo7/4F4jONaua9zH47WgFlf8+SH4EJnQo6Hawtr3D6HCv24ULa4TfFlb?=
 =?iso-8859-1?Q?yxt2n+y+FQTfAs7Vfrcm/+dwnEGYIpNQqAzm021vxYeeKubHOlxcOjAUgl?=
 =?iso-8859-1?Q?TMnBeDxt1UK6BITl9ZZz+nrZxjeWGFP59XeB/YqB3nnieMang07+9wvRk8?=
 =?iso-8859-1?Q?lumzFmomKWcJ0dAHnAqAfy3wyzELNhuwqJ/eU1BIuaxDRl2ypI6jMH6Mx+?=
 =?iso-8859-1?Q?ZjZBqwMIPT1Eg3EL/hzjWO6scFdmIVorA/69zcllKb4vcSwcIZrT+D5Pjl?=
 =?iso-8859-1?Q?YIrqqZxoVblqz488SLCj9pjuQJswi4iF8wdj7UP5spCZDt3feftHxooQW8?=
 =?iso-8859-1?Q?mcEaYGpNwQdLS9/tEE0nzEMbBqd3E3Kn0KjzyvDN14U7mgjubOQ9wZ9vRj?=
 =?iso-8859-1?Q?DY/d+HG3007LYYipLnK4Zvp10OKyqJRWHveEq55NvIIhMb/RigHhoaM7nx?=
 =?iso-8859-1?Q?T/rDoXvO2ZWemiBMnGKYf5AAeMZ2LaNhyS1E5b+uqq0sMZHzh8tG4ry9R7?=
 =?iso-8859-1?Q?pPEru4Cx62d6kY1wKvvwTnBTMBdwZ7rtv/KFdr7k/rm/XoJZ1vzEipKQbj?=
 =?iso-8859-1?Q?59H9y5qrIAVXj3MaM83QJA0TQb92iY6F38V5XoE1d9oPRtEm5V7gpOezFP?=
 =?iso-8859-1?Q?RwTZmi468gcWJBcb8bjVZ4od8FekA7fEUnhmiPKGDwmKo3TaljbKkjXWNv?=
 =?iso-8859-1?Q?82OOGz0BtmUfSTiKamqodR92pIGLcby6bKS1NljknHUaQhV60dYzHs3rhf?=
 =?iso-8859-1?Q?Q4e6yGrjD6nrKGuAWf5+q6ISBRIsbAnc4m7ZKMA1H2YLnuzR/qfg0haPoH?=
 =?iso-8859-1?Q?VYiudWR21+14Ig+B79dykho7r1stVnpl8BPf6mUI3yYe01seTRzFAnx1Ju?=
 =?iso-8859-1?Q?NlsfbOgrGsLINj55bhi9hrUAauUMHSh/hdp9fDeUP2AgQdTfEVUqMnktFa?=
 =?iso-8859-1?Q?hVm5ULYyuSthtpGOUfmjHiNywRXjzS0Wp6hZ/5OK2+sQbKW8rnKS+OWRex?=
 =?iso-8859-1?Q?UXyVevFJvGEAA5lTt+ATORzV69K2w5geu3Tprft8dGf8Xi85y3u9YrJETb?=
 =?iso-8859-1?Q?YiBdV+V/cSvM6YKS40Jj3l/YRFvig3Va2edgfX1/+xKuhYQOCHV5Uuguea?=
 =?iso-8859-1?Q?cFpv9oxRD8ZLWDAnG2KFapLfMXTHsEZmdh0aU3DSnJEGtGC5FGszhU63pK?=
 =?iso-8859-1?Q?tzVwXSJdBbTja36GKE2OS5VnsyIGt0Z/icirQGfOCphvtRayRuY5Pi23C0?=
 =?iso-8859-1?Q?+/6YVAapEPZigwAzAjabyHQnCT+iORN/+ZdSldYzfmutAt15PR9i8e/z5p?=
 =?iso-8859-1?Q?3ZLT2b/f9dY8G3/Hs+FjS18z7DZMS/G6kPQ3Jw0wjXgfMB8A7XX7MxBYED?=
 =?iso-8859-1?Q?L4NXucQsNDCvs3AHQUfQ/T8rP2tRxAT6u2C4hth4Dot7jYieQeaRXvf56c?=
 =?iso-8859-1?Q?OLNGCOHGV4YqXcNe4trLTmQBF6ZJR8sUCbwl7RhhNIwggrNQ05oDhMPkrP?=
 =?iso-8859-1?Q?OyRp4X+ruJBBDfujTG/96b6ih+cwMS//9LJlTA+QQuZSx+Gx4o0+QI7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OeYjgreM6IUkIr2mpNbzoAJqRNbSU1SNTkDdWCDa/X7upKIzlGN8nKX2OCfNUIf2qRuq3UKF4ezp5qcinlYZ2K4eb6irlkBan3oVaVQlnIxMG+G/Mz5w833g/a94iLZnMK+/Pfruh2O7fyK3aqUuDiaJ2t8NlMhDALHujl6aj22x83xt5/cICV+B/2wwleWfhxZNeGPrZE67qt8KcijeffqZ+Z+FQrjeR4QaEQjS+ruKRTMlwAkhiexxXfAll0Wpzt5iohUz/fXY0IZptcpR+Q/JbxzNFDpW4iR+mYGTo+/ertCRi9OWtwLDNTafPBwL6tvKCBHlGVUxeO2cm2o3k1MX3znrn0dCQgvlG0XYLdj1YzP/j7f8wtOBoKNFNMx74UzQvMVXWSJETgdwBuEXHhVLxfQAH/IdGsy8kEJmL47AohI41+f4rFkHeBzgYe8OOVJSUxWo3+c0xa1IqFwiWxYDjLyBYDm6RU1e4GDf0rcnrgTWJ+mPlF2UcN+eybVIfVFHYesC6By2QbvvZF2JXa3PzYKknt8u45aQEBEs4lpLu2L16i7p0UOjm4qQiUpRk/0KXM+74lAwrwEyygzfinfb6L/xX+B+pPAUmVFfo5w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b21120b-50a1-4c3d-3282-08dd4010822d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 02:56:20.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8Iy7JHMhDq1DYlr9Eyh2yc0TofbCDIa3F86/2rg+sGRu2Zf9u9tfi5bMB9f+YLD5/JWbyK8d3iaoDEsYc8/OvBWJnGMZ0B14b0bGkNfyPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=919 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290022
X-Proofpoint-ORIG-GUID: NaoLZREp0q8VEAwHHegUOmt7azz-_1WM
X-Proofpoint-GUID: NaoLZREp0q8VEAwHHegUOmt7azz-_1WM

On Tue, Jan 28, 2025 at 07:53:51PM -0500, Eugene Loh wrote:
> I'd like a little more context here.
> 
> Features:  There is a new execargs global variable.  I take it this is new
> to D or an extension to the D language?  Would it make sense to call this a
> built-in variable?  Are we also exposing a new function d_execargs()? 
> Shouldn't there be tests for using execargs or d_execargs() in scripts?  I
> cannot tell if we are adding new user features (which should be tested) or
> not.

Yes, execargs is essentially a new built-in variable.  It is defined as an
inline, simply doing d_execargs(curthread), so it is a short-hand to get to
the pr_psargs info for the current task.

So it depends 100% on the d_execargs() implementation, which is a function
that I added in order to implement the psinfo->pr_psargs translator
functionality.

> Testing:  I see that the following patch (6/6) lifts some XFAILs on some
> pr_psargs tests.  Should tst.psinfo.d be added to them? And should the
> removal of XFAIL for test/unittest/builtinvar/tst.psinfo-bug21974606.d be
> moved from that patch to this one?  And should there be correctness checks
> for this output:  not simply "does this script not blow up?" but actually
> "does this script produce correct or even just sensible output?"?

None of the existing tests should be moved here because they do not use the
ezecargs variable (since it is new).  I'll add a few tests for this built-in
specifically.  I'd be happy to even drop this patch and not add a new
built-in, but it seems somehow odd not to provide it.

> I'll look more but am certainly unclear if we're talking new D features here
> (and if so, why they're not tested).

> On 1/28/25 01:31, Kris Van Hees wrote:
> 
> > The 'execargs' global variable provides the psargs for curthread.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   dlibs/aarch64/5.11/procfs.d | 4 ++++
> >   dlibs/aarch64/5.12/procfs.d | 4 ++++
> >   dlibs/aarch64/5.14/procfs.d | 4 ++++
> >   dlibs/aarch64/5.16/procfs.d | 4 ++++
> >   dlibs/aarch64/5.2/procfs.d  | 4 ++++
> >   dlibs/aarch64/5.6/procfs.d  | 4 ++++
> >   dlibs/aarch64/6.1/procfs.d  | 4 ++++
> >   dlibs/aarch64/6.10/procfs.d | 4 ++++
> >   dlibs/x86_64/5.11/procfs.d  | 4 ++++
> >   dlibs/x86_64/5.12/procfs.d  | 4 ++++
> >   dlibs/x86_64/5.14/procfs.d  | 4 ++++
> >   dlibs/x86_64/5.16/procfs.d  | 4 ++++
> >   dlibs/x86_64/5.2/procfs.d   | 4 ++++
> >   dlibs/x86_64/5.6/procfs.d   | 4 ++++
> >   dlibs/x86_64/6.1/procfs.d   | 4 ++++
> >   dlibs/x86_64/6.10/procfs.d  | 4 ++++
> >   libdtrace/procfs.d.in       | 4 ++++
> >   17 files changed, 68 insertions(+)
> > 
> > diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> > index 70a43ddf..9c06fe1f 100644
> > --- a/dlibs/aarch64/5.11/procfs.d
> > +++ b/dlibs/aarch64/5.11/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> > index 70a43ddf..9c06fe1f 100644
> > --- a/dlibs/aarch64/5.12/procfs.d
> > +++ b/dlibs/aarch64/5.12/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> > index ef27bb70..2824d137 100644
> > --- a/dlibs/aarch64/5.14/procfs.d
> > +++ b/dlibs/aarch64/5.14/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> > index cad2d2c5..daf30745 100644
> > --- a/dlibs/aarch64/5.16/procfs.d
> > +++ b/dlibs/aarch64/5.16/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> > index 6b1b1b9c..3594e5e9 100644
> > --- a/dlibs/aarch64/5.2/procfs.d
> > +++ b/dlibs/aarch64/5.2/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> > index 70a43ddf..9c06fe1f 100644
> > --- a/dlibs/aarch64/5.6/procfs.d
> > +++ b/dlibs/aarch64/5.6/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> > index 4cb7b77c..2d52f079 100644
> > --- a/dlibs/aarch64/6.1/procfs.d
> > +++ b/dlibs/aarch64/6.1/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> > index 4cb7b77c..2d52f079 100644
> > --- a/dlibs/aarch64/6.10/procfs.d
> > +++ b/dlibs/aarch64/6.10/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> > index c2be76d8..7679db2e 100644
> > --- a/dlibs/x86_64/5.11/procfs.d
> > +++ b/dlibs/x86_64/5.11/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> > index c2be76d8..7679db2e 100644
> > --- a/dlibs/x86_64/5.12/procfs.d
> > +++ b/dlibs/x86_64/5.12/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> > index 28fada6d..3a348ebc 100644
> > --- a/dlibs/x86_64/5.14/procfs.d
> > +++ b/dlibs/x86_64/5.14/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> > index cad2d2c5..daf30745 100644
> > --- a/dlibs/x86_64/5.16/procfs.d
> > +++ b/dlibs/x86_64/5.16/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> > index 08696cf7..6ad926ee 100644
> > --- a/dlibs/x86_64/5.2/procfs.d
> > +++ b/dlibs/x86_64/5.2/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> > index c2be76d8..7679db2e 100644
> > --- a/dlibs/x86_64/5.6/procfs.d
> > +++ b/dlibs/x86_64/5.6/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> > index 4cb7b77c..2d52f079 100644
> > --- a/dlibs/x86_64/6.1/procfs.d
> > +++ b/dlibs/x86_64/6.1/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> > index 4cb7b77c..2d52f079 100644
> > --- a/dlibs/x86_64/6.10/procfs.d
> > +++ b/dlibs/x86_64/6.10/procfs.d
> > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
> > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > index e9d50349..827d6b81 100644
> > --- a/libdtrace/procfs.d.in
> > +++ b/libdtrace/procfs.d.in
> > @@ -307,6 +307,10 @@ inline string root = d_path(&(curthread->fs->root));
> >   #pragma D attributes Stable/Stable/Common root
> >   #pragma D binding "1.0" root
> > +inline string execargs = d_execargs(curthread);
> > +#pragma D attributes Stable/Stable/Common root
> > +#pragma D binding "2.0" execargs
> > +
> >   inline int CLD_EXITED = 1;
> >   #pragma D binding "1.0" CLD_EXITED
> >   inline int CLD_KILLED = 2;
