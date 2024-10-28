Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F70A1DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150348; cv=fail; b=oI4Qe0406S9fL58l2CntNt51i0csnnG0INCpszGyxiFgUm7N756pDqdx3eUAK14b4JivVDWDDweqp8gVR2K1QIukcxss/Cm425WzDwkqgIHmQpRby1pVSXGaeikam0TFWjlANSreLfjyLjWhVanDT9THc5e815N/eBib3sz4MKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150348; c=relaxed/simple;
	bh=OJMmNCE2imSPnqG6C2807+CMZH/cWVEoKaCWXLIQi9U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxmPctQS4DIdKM0D5IH/74zWSEagNcBE0cJjXooMlAM9nvfwzo97djz/ipEAOKkhIalYjiuHViF7R2+SsfgxIta+2rRHUTCvnTAgZrlABLEiWiOJLdUocThkMv/12HGFSpYMzuMmqueaYM+N+mOLiyY8JUsCSZT7+vIci1w7lZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=On3jVggw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xKEYNv44; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="On3jVggw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xKEYNv44"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtcKB001657
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=hgDUEQTOmY7oXPdWfXT/OgtEvm+vnYCoqB2rJ7H49pA=; b=
	On3jVggwIxVKvBPsv2I1537AQ1Wi3Ey9fVI4W4O+WyjSAoB/8AWRFIZyTS5nhoNU
	Jd/HpF9vGoHNd41SlBq/HSdodGM/6s0K59yCqTg7g5K0/pjGt5fMl7Glyh6O5QSt
	2Vz5jsTTf3MzKtSnLijJehHI929eehpQ0eQLYC8hGxslD3A6MAUGXn99TclLVIeM
	aA/p8zzuTVPAtBxkAC8GiRz9B/i4ZyRNGI66Y7LnEL6tdwgNluPXUONzqZuBXk3w
	k9k+z9SwUQuYIXvhvrfv6gpVezzGJ/WuT+gt/UfhcLwmMiAkH2GLfHa+B+a7d3yS
	5F+2MAI6mSOfr3uZwW1iDg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxm1ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKhv3q010182
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8vu5ys-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jz9v7K5Y+cl3A5y3nnRYaaj9OkduWiWtfg8TufKwXzIbPgLg1UKo1hVv+FsCyjLrq33OW1fRxyoQoJejs5i7wh3XR8NdPhRmoX4ogU/rIVmoHPvfMr3ScGeKGjfps/NnT7o6Tx53PUIk9s1oTHwUOFSYN8E5aubudESO0HzgH2KmT3lvloUkq01DK6T4TA61O0YlvaLzHYLxde3hQYvXR/obXiFSswj+rP2fLido5XrdkhoRRhW9cIw/4FdxIVEQHKqo3T8fPLpClOBuY71h88Li2uFAxeuBG1HjoVlcG0bYx67P8F9yuDPYRjU9wcQULzEPHaTWG5wVWNwKe1kVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgDUEQTOmY7oXPdWfXT/OgtEvm+vnYCoqB2rJ7H49pA=;
 b=GFiAxSBDeovRh6aE+V0bhiVBJtSoTzCy5EJkSRl8xBPxkF8mvIYfuBxpTwt9ONv2kXYqXwEXEuWFsGFDnEX2HKhOf7P+b1p4+DUOkzpTkAqbhajtQ+D3KHqreAc/tYBAtG1enQr40ftM0mLKdom59fjX4ZRLVIKQ0VR0nT1klzh74DEI357IrNDW473dCiphEjLdq32tbOX2ZxgW9CGQPRACU+iybZMtS+4xwKVgISAXKVO3mdNFqUKKAz9lNzggL/25KZuuKvS2kZMGFUxV2CVhQFFICEUkLDyuOXC3nXDaYjc5ufhmGwdaw5sGrgWW3V94fSltveiqOBMwFcUz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgDUEQTOmY7oXPdWfXT/OgtEvm+vnYCoqB2rJ7H49pA=;
 b=xKEYNv44Km83ZhcIxfVOy/d+oC2UV+uqUln7BJWgDXJY7PsBPJ/FRkDoRTKF3qatQk/eZzd921CH756wvwSRmfzdLaK542xZbI9ruFHcExpDbMQkaE3AYuUGKCmp8CwNmvDMvcc0x1xTMo2bn2mXthEF1K8KvH4OLCuTXAzN7G8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:19:02 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:19:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/6] cg: add argument mapping in the trampoline
Date: Mon, 28 Oct 2024 21:18:47 +0000
Message-ID: <20241028211849.458862-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211849.458862-1-nick.alcock@oracle.com>
References: <20241028211849.458862-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c31760-6863-4596-9d91-08dcf796250d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMrm9amtKZHIn6yZ3tidensPjMsNBkpgeTJ3pzjwknk/7m5Bhmt0hTIjE2dA?=
 =?us-ascii?Q?bjflS793ydQ9yRQQUMWNTUKUTE6A4FUgEg8mZN1U6uOTrdqjZjRPiKfv5hw/?=
 =?us-ascii?Q?6FdhPVywc2s2Sgnoc5Riv2E6tlQcREBvbehDT0akEj7tGUZFrtVoaReLtWSr?=
 =?us-ascii?Q?DSRuS2bLk+ytr4EFW4vW1jqFtCpvTs1MV/zPMCk0S+MvQ8YguWFh6GAG/yr+?=
 =?us-ascii?Q?ziAnH/dw3WKD0zNIyOEf4HmsQf2lRM/OzuaPtIfVSFDPSv9wP9VtIIqILPtL?=
 =?us-ascii?Q?c3tblIJhO81a7R1fhhW7szGpSqK1ohYoYYgVGj2oBb74pXmbXDMnVc59hTmJ?=
 =?us-ascii?Q?OGXR3pPKHO1+ALeTDvjJo2vlO7WSvt7fmTT5LdWhvggg7nxgPENPbeVdNSlq?=
 =?us-ascii?Q?rq5cOrnLLFjegWSXnglPoVpGbUIaOIqCyqdNS0EK92mF47JNwvTH+hFsbEyA?=
 =?us-ascii?Q?cXLTXPz6r6NEW69XKhM1VsP7Eg+NAoBTd17dcvAVqBHJa2dqorrqfCh99iXh?=
 =?us-ascii?Q?TWBh7tSTMp6U0u33nhUyyH/5JNScf2bhJSn17T47NbsoG4K6ZqAlbwfC93Fw?=
 =?us-ascii?Q?gMvpZiQosvmr3RxSIjLTz+JUbZGWB8zIcaeB5QMnWtE+dAbRfAe+kZtX7rjl?=
 =?us-ascii?Q?0ZyVKLTvI+0K+zA/p3pQZqeYD+SQlgoLER3r0pUAyN+jiGcGLi2Pv4FXuh/z?=
 =?us-ascii?Q?i83u5fFlUlD8jwsFQjhMbTZ9R04NFrabJdPUb7bTIuLI95efUkt2tVK5JAH5?=
 =?us-ascii?Q?KGgB+zw7F0Oxsv3mjlNnx9WGX1ylJgPnoDeBUj2/SoBXHMdf/dNbLqhFbZa2?=
 =?us-ascii?Q?+Y9nAVGtAiyUJPenu11QsipmCV+p4snxxzt95W91Sb0/9ijEypWl0uGigaIU?=
 =?us-ascii?Q?bWsWC3yolzLcLd93lFvmzBOk1aSCT0GHLzZWU9coKNQifEwa8O8mXWyD0hOi?=
 =?us-ascii?Q?IH9N3yu6cYKUAmZPoqx3jkxfi2m9C3dltaz8wxZ/JveYfrSgnfZmYCiCLcbH?=
 =?us-ascii?Q?EDiWMV8l8QBpQunfeboFN7LkyRChkn841Wzb/jSGEzmRpnP3SlFJVTQEiBcB?=
 =?us-ascii?Q?r/mfvg4H/fSBv98zmnsp/OTcEz42csh+tZICEfGgW8jjcjNRJgP0Vd7W2pIn?=
 =?us-ascii?Q?2niAgdbD/zpOoUBP32vthNIOndhMdPs2gaoB46PvJYXDUENKs+59bZlmcvef?=
 =?us-ascii?Q?SVOtVUJU89oZ/GoDy65SqxRobf5EHkYJc9+RyLS4s2+OPkPbZ9ONfOJdOQO7?=
 =?us-ascii?Q?8A51r6aKXIGQXk0j2l87G52HM8wu4ITFG43NCMmli+kSj4M8krG5wh5lKgqe?=
 =?us-ascii?Q?AzdyHBJblUtj6abPU4zWxliy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/71zKoEJKaNd0bzO1fru7mOo0sk3kJyeWY4AhE7CJyQzy++A+W03B2Y+zEqA?=
 =?us-ascii?Q?Vi743bXAgyN59frJJaZuJbRWkvTR2zMSqXn5lVKDX6N4/t57ex2iU0m6H4Wo?=
 =?us-ascii?Q?HJ0NlppxqILPyGVg1jDJZxcMhrkQpHjbQ9XV+XSpveQ5mk6YrM+FJFug8APm?=
 =?us-ascii?Q?7WJApPbBg/S9j0jc8Oc59h5t74Ro+ZTbtnG6ww4bIieVmdEAVGae/+AgQcem?=
 =?us-ascii?Q?BAQiKOnmXW452JDodMnBcEX4TpwVqz8agDTmj5DlrXlorO0KaK1DJdL4GWEr?=
 =?us-ascii?Q?/Aho9ifSjhwcbz6s4f2KEiGpB5vBmC48urbQg+5NCAAuVfXCJ1sBrv+n1YJC?=
 =?us-ascii?Q?aWyd95NS9NBFsRGeJGlMTA1tAFRXFy2eZhNG7cH2Imv217/6i533aF3ZIm1Q?=
 =?us-ascii?Q?8LQLMtAunBrLxHMPd2IOefI3aDUFrwxjisQ94DhqUgVYmMSaLZAkagxdTcaE?=
 =?us-ascii?Q?pM6NqfXjfJpDxz3WxSzxCzdo641kD1AtAOg3yJeMKN389B4z/DTAUoI+1maD?=
 =?us-ascii?Q?uvGzQ6KDtphpt2FpM5A9I8NU9NG+5LK5QtEAsL4sAH5w0AqHEAZ3tgIOI1Gp?=
 =?us-ascii?Q?DmxzbGu3+UEsqDJxOOR+k8niSatHxoUvbnGzshLRORubZ630jYqdMhn6pef6?=
 =?us-ascii?Q?MbtxRmt0jcd/xgkMnf84CMNK7GDqK83DcIVEF6dlj3egmnHq2RQzKN/oPhDL?=
 =?us-ascii?Q?AP/Cl2766mQZAVBZzgYRZ0vgY7UYanUQnC/hBbuS3RaUWaWIeypAe0olDHUG?=
 =?us-ascii?Q?rcQYDwxWaPYVXd7SIGzf3WqwfH5zfZEy3nEg70MI1+0xxRdsJxkqpSvCSNU+?=
 =?us-ascii?Q?fvvPxoNHdGi0O6fseqvp87tPOn+urNRxj36HMX9IXZCedepSPuuKOq5zve4X?=
 =?us-ascii?Q?KCUOWNt3M+t6feDIekZLChgcPl31NDywKqjJn+hxUfX7+SFYG8oXpKommXQn?=
 =?us-ascii?Q?AayCiE+7WUinii9FUyHd10oGRheRTBwIy9gVcCNpOLqPzx2HDS7NN8oziymo?=
 =?us-ascii?Q?zF4q79yGp3FR7JgpfBFOcDATwFmJF7PvYMR3//l0LR5mtZTxKSbNmpalWZJ0?=
 =?us-ascii?Q?TQrcJ22HKaLOgjEegoX8/v94HSROUhN4BK4L7pv5XBd5OkZecuTGkNA/GsKk?=
 =?us-ascii?Q?sWiNQvlT1MBZfr9Byn980M7maryRCBqSZADBPMDyO+w/i6c1+EHi/smFJCFK?=
 =?us-ascii?Q?FBqR9ntN1oj86keDxqGxDGPd2Hifii4q7NpESKVZdIInyZ9POxSDsMuyYdqM?=
 =?us-ascii?Q?vBqukFNCKJe026CypDosPHf/3KSxErZT73pIjsxNqtgNVTOAfnNmP3WUJKEZ?=
 =?us-ascii?Q?d8IV5o2svmfAeZTDHPvBUj7RWZmCwAvWvwn3OmA3t2g5YdVTwHyuuCkzc35j?=
 =?us-ascii?Q?q1aZ0bzVP4ousJ7sS4FcPI5dNa3LH4TWeLP5GPfIUfgQ7IQsS+CnDTDiTa+T?=
 =?us-ascii?Q?ONeB9rfEpdctUMNh5wtI4TDAqVOyXWCW4K8Vu6KS/DB3NKswBMCjIOWeEMls?=
 =?us-ascii?Q?4GpZtNu2DQZbJJoWGfcORryxDdYThSCjvtiH78Btg7VmX09d/NxIgwudWnM/?=
 =?us-ascii?Q?tVIvcmuq9F9ZY39B+Op2R4+V9tK9AP/SEOn9g4COlU+UEAf+yJNcJApp3UuQ?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R3l1TSuV4TMjw/Uoxf1H0ihNrnwq81C8joLGDhKAR9zADsOwAmykCyYd2DoXxUfd96yymIyS2LQtxRwYi+9jo4aXjjTA5juTFIGLXAyM29Kl7uGYneDE3pVWHfvkk5WzG/MFhSoZ/wXa1C+pOc5o28eavwwvJvwCyiMoa6eqxkNmFwutwItEU8bewbBhPOSSo+A8Mttt7FCEJjg6lwyc6UWpByOcrnn44935QKKHDtzATEvmtCP9wXcG+kx6XXb+kz6XlQIXZQV16KnflItzTh7sS2lY91ZdfDRzDoX4jiEd3n6xTE6c5OZtg34cpa8pbcfUkJvKg/kvYWEpUWJ+mm1YOujRtuc6e/vruEQjuWzQvcTGlyH0H20KW6MZaCDUWdaA4s5iNx9Ro6eCdUojActRHuJFtMAtwPUXcCtLmmpuUZgvJCYVBq4Vag1TYh9GNZtPvDpPnb/isroDNisllvXwyFHU4vO4AvNje6BLNs0FVJBZx7pYjbdDgwXJq5ZOc/F/Ey/0K/7xGBW2AfYIt0H2m9VyijpJfcgl/Zn02wqEap1kitkif3DiI7MjVE6m1TuEve2CdXCwSalGwUxXBNdGzvFOj6f+Ki4M91Na+Y4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c31760-6863-4596-9d91-08dcf796250d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:19:02.0146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnBKx6bsFoiV8wPg+L9OjlPpvbZi9w693dQJzsxthzCl+TVkZmozw3JmAhCsQsMWCsKH6Xs7nxEz2Ri43P2eLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: nXNTETWPequVQIlVWaCp-DVw3RoV5gac
X-Proofpoint-ORIG-GUID: nXNTETWPequVQIlVWaCp-DVw3RoV5gac

Before now, argument mapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that arg mapping is also applied to
argN for USDT, even though this is inconsistent with SDT and arguably less
flexible than having argN be the unmapped arguments in all cases.  Add a new
function dt_cg_tramp_map_args(), which can be called from trampolines to
apply mappings (destructively, but it keeps a copy of the old args in the
save area so you can unapply them if you need to).  No existing providers do
any mapping, so this is not yet called, but it's about to be.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 36 +++++++++++++++++++++++++++++++++++-
 libdtrace/dt_cg.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..959be5601ea8 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,35 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Remap arguments according to the array of mappings given.  The original
+ * arguments are overwritten (but saved).  In effect, this changes the native
+ * arguments: the caller should adjust the mappings array accordingly, and
+ * shuffle the native arg types to match.
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	/*
+	 * Work from saved args so we don't need to worry about overwriting regs
+	 * we're about to remap.
+	 */
+	dt_cg_tramp_save_args(pcb);
+
+	for (i = 0; i < nmappings; i++) {
+		if (mappings[i] != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(mappings[i])));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5060,7 +5089,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * array index according to the static argument mapping (if any),
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
-	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If dt_cg_tramp_remap_args is in use, you should apply the remapping
+	 * at the probe_info stage, since the effective "native" arg positions
+	 * will be changed.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..8f66b7a7cb98 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

