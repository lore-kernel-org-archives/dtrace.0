Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB1179BC
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524038; cv=fail; b=GX+HoVqmYpykxYY0Og+rHHRQ59al1KfKwJ4J8V82auqS/auwmoHtoFydDmZ88284OwDJlfPcxdFy/E54jAcXjKLDfIGtOQxQeKjT1OWor4mnGaA1EwH9D5YKhBaD+kCWMPTsuHlbNvOAD4RcpXZmYW48Ku8e9ama1INMJCc6nLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524038; c=relaxed/simple;
	bh=4kFjDq9MDDW1S+zzny/RjbqY9Cn2QHTN0utiJPJjH7w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XcH9/V+lFJVBxZ7Zt9IoDA9D9IdpI855R4Et0yk4KOXIrBluwt6qdd04UzCHOrWmwD88T65eShtfGUqp6Ioh7rjQQ8nFt/xv/K3jDaO8JegRzQWX0cKVgaauN6arSjtf6N2TCo5P1CtD27QySNIGTGmNZ0oTkbRe/59wUVYkdc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bn7Hp006035
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:35 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3D6Am8L+iS7ZXJZF/?=
 =?UTF-8?Q?JEG/fZVGrJpnWm53smA0r2r9UtWA=3D;_b=3DHwETBlGtNubu7YreufwH9g/kcE?=
 =?UTF-8?Q?IIVKtLRL/Lz53va1i0lOru1lSLu94JbfPslZInqA4z_5QrciC26jaKCV0xhLzn1?=
 =?UTF-8?Q?AL3CY2oC3AH/AJPAl2dyef1dAp1c9AazoFLKC1Pi83859Sq4_k6csSrxctSL1Xy?=
 =?UTF-8?Q?kyvuRbqx328E7XFVC94z9qfPkgBzMzg+xEpP1xCs+ZSOcBBBfgfGqW_j+h+7V3s?=
 =?UTF-8?Q?nPyrz8UT36AazLUwU59z/Q6iTzw9VxRYzHvD0gcjp7lk0dcrsy96rdbrKCbh_k1?=
 =?UTF-8?Q?2nTtxrzbvJxleVZBbSg8itX8azwBQiDJt2urZVTfl6xoAQB6rOsUJmSDWfBZrFj?=
 =?UTF-8?Q?z5M_GQ=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuvvwjc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:35 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HV5W3005555
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrmdx9b0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAGh/7R1p+oHxV1tTBq5072vvOfxwhrzkG0kza5yN+qDULLml3iwSjwQu1CUabHfrY39ftk97+KGDlCcuVuZNx/L97fFPYseh2ISSaejH1eVg7zHy9GjZifyRf7fqQVuZTeHHynjY5lbFUmIEoiQUtGuKoxmyO2YTXhqgf7mytyKAsb1dHsTwG4vW9rQaauZfLKowLJL2gr/2FZqP7valnKlVZO8Y1VEl8x0eFMhRHsSZtEvNYNOU2pM9XNRPaFUaLNelR7Z6eo8D5I9RF+G9ZEB/zaBjyJ4UUxzCQJo7z1J3zug0zE5zrBGdw23xFQZW9tCktyIkXF0FADIWGf/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Am8L+iS7ZXJZF/JEG/fZVGrJpnWm53smA0r2r9UtWA=;
 b=fym8nC4JbN+or7Lsyb+aiADjoOGstWXgggoZfwmzIsZ3WF3g6Z8Xa76624U+ltddQqX6zcgMDUu8U+VyjV2HOtLLTzAZsXbiEH5fP9PDvNG/lNOz3aBx/N7wssobYpnRxbM0Ih54+pM63GabheKt0NJMHSEEqUSDnH8jnnHhqlErmBOjmrjVUx6d99l9eCOaVQN7DwINgeB573yU2aV78vmRpiSd+0k3MPlT8xi7D62Cwam32RPPiyln4N45QaX2DmNeAeCQZHlWqp3601v8CDvykIWBX9lp6UI4zrii3MIR208xtN3um8YHiMEIpn21O2+qIQ5JFuV5LdyZIccNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Am8L+iS7ZXJZF/JEG/fZVGrJpnWm53smA0r2r9UtWA=;
 b=MPwSsbMNxOuHXDN2GYhf5zQ5g/Uz2c2eyLALJJwLaUjwgBAsJF5Jyp/SYHRJdC9D/bp0550Atmcg5gk+/6jeU7rFMTgdGaoZV9gLgZG0gQ6dPhZt1kSncqdQx0xu12pTf9DF19tl/Gqw9BDxXIZCWJ30jhZt0BbmdR7P2YkmKPc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 7/8] Clean up double semicolons
Date: Tue,  4 Jun 2024 14:00:07 -0400
Message-Id: <20240604180008.11331-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 8138788f-6809-443c-c02c-08dc84c0398d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+wl2ate/M5i0yuktZeBRwPKPlas3AHcjuZlZgsOLRUFZsTlIguczpTO1WXsE?=
 =?us-ascii?Q?A7nmePrmameUXedbJmfNYP4Kh44bq0Df3p6YaOxWy1+f0alPjf6u3uzS8XUq?=
 =?us-ascii?Q?2s33BMo3zdESixi2GkNQwbFLMxlzRt+qHjVqcOJblZJXzktOO7RB2LiRGNNS?=
 =?us-ascii?Q?pOQHjlFBHzrRcWWGjDinURi3hzX0py9aJT+DbXrd+W+Kr6gSTOoFCMWhjl/Y?=
 =?us-ascii?Q?G7Wls6ylu9Wu3avhdSrAqUjwT92XHlI3F0qlVEeteGJ8YE9tC3cdrn5vCGwP?=
 =?us-ascii?Q?YQZSuh4oE2xI0wUfIJByaEJnuWGqoS5VxMNH5SXPIsojKl62ngPBxOVkrr5a?=
 =?us-ascii?Q?av6CLEHVE+yaJhvQPNS7ancEl3GqZMowHLyXZQ6qSYGzW0RdKkHon6cLkESv?=
 =?us-ascii?Q?8rkKxOoZ/5ihchRm4mrjFzTZFgudirnnJ/hoAexyu8AxgtgGySKoQWSb6BdS?=
 =?us-ascii?Q?pP6AcEDq5Z+kyzQb7fhUCuP2wnklxtI/5WQvAsHOc1qZUDRDNWBRMp3LiK2v?=
 =?us-ascii?Q?4Ipjy4feN7qV/HcCeC9MBNJ4hz9TIaTCgM0ZONsgoYdudrdEUpYKdPShs9q7?=
 =?us-ascii?Q?fGezYXUM3EfZLPSuau9/6drrAohu9K91GLDE1BjPGqFgZT8XyuawQe2FjKKM?=
 =?us-ascii?Q?k/csZ2q4KR42yTUKbLZy1zFGOtnITyrW/OxOy53BwIk7MB5Q3tZjz/e3nELA?=
 =?us-ascii?Q?+51rW5kURi5Fdk+BSpx+9FqpfpXzDk9paVVKIQved2fSj9rRfHy2BzfNomBN?=
 =?us-ascii?Q?84D8bpoZlY6QTlezTiFER1PWiBt4XubjZKoazzqZM6ZVth8An3z8h4ib7uIX?=
 =?us-ascii?Q?XvM2Xo+kapyDDgNuAgYfex+zmRpXw6ZSj+8QRExLsljzogcbEusNSh/VDa0d?=
 =?us-ascii?Q?4teuzVYx4pzp376kqIQuQsH6DYDG3dLlByGvQtqMJkfMeE5C47SpBrzOBw/t?=
 =?us-ascii?Q?SPN5ZsfzTyYK7tmmRL6ByOluRrPkeISoYs+KC119qjjEDeH7NKXnElVtVazP?=
 =?us-ascii?Q?Zo/BwIwlH3LIOuU3YAxYoKrCih14a4sHa35Go1CgeoRkZMQIptP3+/dvbhXP?=
 =?us-ascii?Q?uzCoLsp1N55qHTdYazImj+srCmDS9UEVUlvm5ZTB4d/mahBHKJq4sefC+Am7?=
 =?us-ascii?Q?1z1tAAhWSkrV1sQ9b6kzLEGJTgDJjnquIMhoU/XTVPkkV70fCNsgPjmQV0SJ?=
 =?us-ascii?Q?dm2zNINqcEFOnyF56A6aQmxAe9Uz4ztmre5JMBaSGSzFvT1W5fY6Xpvpmr/C?=
 =?us-ascii?Q?o8WV20j0j4BTK8b6ECvs+UmbhnwNNNF6OTuxdunY9rQn3S3uD2BV5tMZfrhy?=
 =?us-ascii?Q?NRE4N5Dd1CERmaOp7Z3fnK8I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S5suyHY42eq9uSSquVY2san+j9A6F3H6MhfWFt4Rm4fgInugdj2f3J5+CLcV?=
 =?us-ascii?Q?r3jFuhwo0D+ASqfMbbsiGjEQv5oPaE/fT/7PgkvDZ4JKTA3cgynr5/4JjNGa?=
 =?us-ascii?Q?+bITxRhv9fcBqCQ18AbjC7RM0Dr/M9yR2ffTGfwShH1H5/2lAj8RkYby+pUD?=
 =?us-ascii?Q?wuV1B3EYafu/KfITfAjrDgYLDojyzhshVW2hx8+3Mvt2b8XHwqWGIZ6OrlPE?=
 =?us-ascii?Q?aTfrjWORg/GUTZqEkHA2QDMJBl32l+GEf0Kk5V2g42oFqj97ZehmpGyzE7h+?=
 =?us-ascii?Q?V+e3n9ztFV1e3NBLeHgm9G0JcOGmFO1//vxupJcdCPBWDcjnKEgEvS+k8JoO?=
 =?us-ascii?Q?DWddySAkuq9dsnXQl+eDmGB/hvx3Yspaa48pJzvEC3y5QVs/PNgDdDfE2Pxk?=
 =?us-ascii?Q?0XZl9fx7DYEy9bRmE3U4jPFlqsol322Bn/hNOhxMfzV2+8VQOoWdjdHmvBu+?=
 =?us-ascii?Q?sYDma+mLEIZs8l9Si1LTDSfaLTue0CM/E1Di/uYb9PHbaZv/v9Iwg4v46pTk?=
 =?us-ascii?Q?OAz3erclgEPKUjGgB6105aFoAmd3HlBmRMrfKZCDPeouZvR6l+BsWe/KJUnM?=
 =?us-ascii?Q?ZnFaANMmsOxt8DAazMLm5wx26oXaj9od23f8oC/0d34nI94zzM6U/5dVL5pd?=
 =?us-ascii?Q?Dc8liJKSeOipB6NOxyM5cy+RbWzzFrkEuVo5gd+LzRPE3TtE/3RSU+ZOrmXS?=
 =?us-ascii?Q?gn1KBYURMnGiczrY1nz2aU9WkuzcJm37bKPuBmdJtydbKC0RgSH2eLtjPdRa?=
 =?us-ascii?Q?VsE1WgAuPJGwqjCZCnTh/M+nS4wUb58iwlGrbqTUWpLFWaABLhazo9OfQuJg?=
 =?us-ascii?Q?4Ibpg/SwGqnjNok5pmNc0w/CeCzEI3yKWlH8zqpXqTcYE2w3YoUxTvwVxgsr?=
 =?us-ascii?Q?0lD3ilGAMjW6yHRkAjrgySOTdULgPTkktYueTdtE9FGHAmx+/Qt/DfuceB60?=
 =?us-ascii?Q?rTbvAzGro6c5HvUX39DPxIpTNw0okGVSrTJPJc0N3FVdBEYh3R5OATNOG+ni?=
 =?us-ascii?Q?9nTEqsWA7osIJWFWR4vOoaBV7ncrXT0MvzlZ4b9t9e1gJCatUfvnYWkEDB1q?=
 =?us-ascii?Q?nt5G6eVckMC2L2dfqNRhAXCFVGy5Ex3FULOhXJosiN85zDEzF6dw93t9dunA?=
 =?us-ascii?Q?mQpzalwvqzPJu7CqsdgL6cXZqeOOgQeEqO1t5kwm/i1JN5evPzVg0EyFP1uh?=
 =?us-ascii?Q?1ZAOHQjr8Kl/+0cuTfp7BuiCdnbcq7UYJWmbrTRfquBWqU7zWYf+WDoLVRF6?=
 =?us-ascii?Q?oNvW1z+RuH75fOGm4RiqYnNKGRW+0JGlqx5b6cgbw4RvDgAB3clml6BHk3ls?=
 =?us-ascii?Q?XhdAjljWTomnLa2W5v0cXTZmZm1z1IF9o/br7b558Y39EOaiQNSm+sggIx5v?=
 =?us-ascii?Q?AmbsIXJAOGjRtpLLwQ0ba7iFMGiSE0dw9Gr9iitfN++G5GQ0qduuu8kuW7nX?=
 =?us-ascii?Q?s0JxOhhNSEkNkY7B6FqcQtcrDRJGN3LGwOtygpjH9vYej1dzdhE+GUcKU4FM?=
 =?us-ascii?Q?q31VK9IsSuiIaKBrz5IlOlBMbcIZB6Aiu0nSXM1lBIsbHIXQOLpHu4SQKYkF?=
 =?us-ascii?Q?n2t/IQ+ZB8xFNFJfXL8I+AJ/gSgLNloZe/CD5iii?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Zb6+YlBFhbdeetkzHrp1Ri7M8+gqkoWZCO5wsbY+6nfN46V3ElDAuVP4WAzV5Lvt9z/mHn4lnVluPXH7EJeC66nMpVfwyi8gqowfEOCaHnV+wTN/E/xe5PIs+LR26c1dInzKnTHOTFfxUhChv0lrzmHLom5pumZhDyM9vs0YWV97oLSgIDdbn71xrx/ER90108mg9/iu3gPlXx5VUQeBveRkn6XQYRzBqZVljo/v24g7caD2+aeO0cK9Vsm0IIr+4eP8Nz8+8zZda1DqMxcnHjEAVOPh3l2TZTYM3fy1idLJycS24RWOftCF2OWQVoxf9ctRvunVOEzOwzDRI90cOChBAZnw9bmN6N0W+sPmP0kd1aqKUpBYUROfL27uJLPMoneaK2o/Pn/W85q5cVieZ8kBRibrnQdNUhEg15g2TdicLOckE8ipGKzTkbUoL3gZ2sas1c2AP63MPeo5Uw8NHnEKXMLqlsiMqTJi+uYPT/Cq3UAFXbnvml+tL42yCog4eA+Tg3bHxLepO5LPuSv8+GBhb3VwnyPyBq0mHKJzu/LfMgREKbWAuoHdwecWTfF/Mjlv3ZIOof0ViyDgVXboStIg1koaRU2U8XFrwv9drcw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8138788f-6809-443c-c02c-08dc84c0398d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:31.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03W7vY62JEmvaG2tjReOF7ILA4xBkSexhvyG2sGId3TK8aqihz220HxpMYEKr8WJTc1LqiE/+Aj0llWQej4AXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-GUID: bgTxqDP89AlVkvec1uqd6-4GvnmfLDSC
X-Proofpoint-ORIG-GUID: bgTxqDP89AlVkvec1uqd6-4GvnmfLDSC

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dtprobed.c          | 2 +-
 libdtrace/dt_cg.c            | 2 +-
 libdtrace/dt_probe.c         | 4 ++--
 libdtrace/dt_prov_fbt.c      | 2 +-
 libdtrace/dt_prov_lockstat.c | 4 ++--
 libdtrace/dt_prov_profile.c  | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index bbdde35e..fdcdee14 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -516,7 +516,7 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 		gen = dof_stash_remove(pid, (uintptr_t) arg);
 		fuse_reply_ioctl(req, gen, NULL, 0);
 		return;
-	default: errmsg = "invalid ioctl";;
+	default: errmsg = "invalid ioctl";
 		fuse_log(FUSE_LOG_WARNING, "%i: dtprobed: %s %x\n",
 			 pid, errmsg, cmd);
 		goto fuse_err;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index fc2cebf0..e166d2d8 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -6562,7 +6562,7 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
 	dt_node_t	*af = dnp->dn_args;
 	dt_node_t	*addr = af->dn_list;
-	dt_node_t	*tnp, *cnp, *lnp, *rnp, *anp, *xnp;;
+	dt_node_t	*tnp, *cnp, *lnp, *rnp, *anp, *xnp;
 	dt_idsig_t	*isp;
 	dt_decl_t	*ddp;
 
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 4f8730b9..e1099d75 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1345,7 +1345,7 @@ dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
 {
 	dt_probe_clause_t	*pcp;
 
-	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));;
+	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
 	if (pcp == NULL)
 		return dt_set_errno(dtp, EDT_NOMEM);
 
@@ -1395,7 +1395,7 @@ dt_probe_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_probe_t *dprp)
 			return 0;
 	}
 
-	pdp = dt_zalloc(dtp, sizeof(dt_probe_dependent_t));;
+	pdp = dt_zalloc(dtp, sizeof(dt_probe_dependent_t));
 	if (pdp == NULL)
 		return dt_set_errno(dtp, EDT_NOMEM);
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index fa888ed8..f9d81d9a 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -367,7 +367,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
 		fn = dt_alloc(dtp, len);
 		if (fn == NULL)
-			return -ENOENT;;
+			return -ENOENT;
 
 		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
 			 FBT_GROUP_DATA, prp->desc->fun);
diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
index e98287ca..c73edf9b 100644
--- a/libdtrace/dt_prov_lockstat.c
+++ b/libdtrace/dt_prov_lockstat.c
@@ -288,7 +288,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			return 1;
 		} else {
 			int	kind = 1;	/* reader (default) */
-			uint_t	lbl_reset = dt_irlist_label(dlp);;
+			uint_t	lbl_reset = dt_irlist_label(dlp);
 
 			if (strstr(uprp->desc->fun, "_write_") != NULL)
 				kind = 0;	/* writer */
@@ -337,7 +337,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			copy_lockaddr_into_cpuinfo(dlp, 0);
 			return 1;
 		} else {
-			uint_t	lbl_reset = dt_irlist_label(dlp);;
+			uint_t	lbl_reset = dt_irlist_label(dlp);
 
 			if (strstr(uprp->desc->fun, "_trylock") != NULL) {
 				/* The return value (arg1) must be 1. */
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index 86fc03cb..bc224348 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -261,7 +261,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	profile_probe_t		*pp = prp->prv_data;
 	struct perf_event_attr	attr;
-	int			i, nattach = 0;;
+	int			i, nattach = 0;
 	int			cnt = FDS_CNT(pp->kind);
 
 	memset(&attr, 0, sizeof(attr));
-- 
2.18.4

