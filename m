Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F382D1F44
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774601; cv=fail; b=UHjXN8McB7TmYuwK2KU2+HOYw2PqAXvReeDhhuSY4C8ypMQYVqpqFTRcZcfBcwFHear0kZXayjQqb86uzFuz/iRU3T6/W4sJQPEvIxRqewndGgWZ7Vpk/5h1eFeRga5Qvkm9RpdobZ/v9ZW4nt2TE8A9ftTgN0CfuRL4IWAWXoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774601; c=relaxed/simple;
	bh=X8J8whXUkdfdswAEW3hYio0XBE0urld0rTjOQrjh1ak=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Exxbpl4SQIABO4ho4A7MWqMyZr/gpyFUX2NT7Vyrf5OnJqaVMkYVBUNr/dLpTvO8IBFazGzbkVo3TSA+hpOP22tHkQaqoqfTlmqbRhBI3LPIPIbMMsuz8I5XS6VIea52sNXCeMfeOIvT8GMNBnpvRoJov8fNnfHexEr8eko2+4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vq0ktVVD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qS/qVAtj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vq0ktVVD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qS/qVAtj"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCiI3F006420
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ekrsEBO4yqfum/yae4
	0z+JUaZEGiKo9ztLuPK5nhpW0=; b=Vq0ktVVDjuqqstxx6D0xiA1xso3NupRWXM
	cQI17Hqo9+gZcXU3qhj+jNosWlX0+BtHAqSvzwvdsYMUqcle9LTbUSwd8NetCDky
	PchNukMLpevgqrhJwzYj5JUPJs3y73vZ0pmD9oHwNtXwBEldEF2PjJOaRhwR91AV
	TGrM72kD+bkcgrmQhcxaaLE5zuDxThmC4FKi2f1NAtMDKaN1ylxhjiBDB7KgAjil
	myv5VXxCUrOPq0lL2hAe1gPdm1MHPMy1XJRSftMGfD0k3RC5DbfFApYkSK8yll5m
	9DhLcCghAanOU6F4oIuf/I21Oxo824nVpa+CgItCyVhZ+m/6MwoQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y580p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:16:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCw1dT002358
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:16:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpd6pvs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W48qfSl2X38nmtLVPt9mja++DyqV4aa7x9MeQK4lHrBqw1V1WUoZ52GKOlYycrMx0s2AdXoJgwEZx3EIgPliSCnouwm1OphqocTPZktBydIviUTtG52EH1iGOeaR+D1CyEG16NcCD7TSSTd0zKgLLs3crtAXgFdTOfrjG98UBvsl9OyIm07nTGIStd5z6lIf6GChSvtmSnPLnxjdzD3XNPn3mqsv4kExBNo1O00lLfTqxWZwrFcGxaNyMNgvB7Kpgu6AWdWaYWuKfTfpYa3Pndg9NBtLBXuPhPGiyjRiW71sIypWnScHjIbVIKRq91d6Br60vTvJwoAhuKvIAi2f6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekrsEBO4yqfum/yae40z+JUaZEGiKo9ztLuPK5nhpW0=;
 b=PrbzenaIYCWbrCOD5Sue1qyaFsqcshkZxtrlXT+lMtJZmflI1gwj729idofn9vBH3ZaXmvGTvq3JFNTCKryzcIagCStP/vFr/ycbCdbPkkV4RvfkUZI6siydfL2aZIQSv4MqMBJbZ7O5WO0v0zRSEvL0bq0E8m7bHtpEEPdK0qOC1P9krm37fsWkXHuDBw/vC/yrxRFPTNNCBeCmwp/OJJdoVoQkzbYSe/dPYlLkVCkCcT6xx4l7++r1yopz6bI/UeXaBA2PF5oPonoWUICWgDcxMexfjdqo+2PipdVva4ym4wgKRi3YVguYmM+lwebhN84FI9xrTX16OE5Kji3rhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekrsEBO4yqfum/yae40z+JUaZEGiKo9ztLuPK5nhpW0=;
 b=qS/qVAtjV+/xPt+9aABV/k3SkbZaoFSqLCe9AYGdydV7hV66BLpeJi2RjJ5njMbklP/9pvDD77y+VbYXYHq+2lI/HRmi1E1IewxNgqVQsVGVGu283lkhJeEuyIz87Uj24ieoY05xAjjeTrKoJxQB6QU3GSRazMapFnCBIUHIe5E=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS7PR10MB5901.namprd10.prod.outlook.com (2603:10b6:8:87::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Tue, 24 Jun 2025 14:16:35 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 14:16:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] btf: do not try to generate CTF data if there is no
 BTF data
References: <SJ0PR10MB56728D3C877CA67B4504822AC279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: don't try this at home, kids!
Date: Tue, 24 Jun 2025 15:16:32 +0100
In-Reply-To: <SJ0PR10MB56728D3C877CA67B4504822AC279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Mon, 23 Jun 2025 19:37:19 -0400")
Message-ID: <871pr9ql6n.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0574.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS7PR10MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f352832-05a8-48ee-d481-08ddb329b9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rPYXwZKsPACA4MWJQXA3XopAFPLYMxgUVMpTnIGPa6RGXZiHDwmvfz3QmdM9?=
 =?us-ascii?Q?vD9SbdyAiEXdsvds2bhoKEMxUjKSgYTB71y8aawZixlXnFZSNv6zyvYJ9YA3?=
 =?us-ascii?Q?6HAM+l5XY71FVXEMl1dlChjjIFautlQWNQvSow0BUYADL4XPmLRjgV35bCmW?=
 =?us-ascii?Q?oTAj9Lxu0lTrM+wjdMTxQnf4HchEq0RYEnEpRVxuvYFQH1S4mlkj6XzE1DaD?=
 =?us-ascii?Q?lC1wz6ZjLnALjw1CNfuzjrXDmkoxcdYOqkU4EwQ6o99N0toID6ZnylTyWeGz?=
 =?us-ascii?Q?qsMvRM5EU8eE7EUeagCNy2w0zxV7HJzPhvOFlaAeFN2vPANTlgCk64BgjKSX?=
 =?us-ascii?Q?72pFjRVrZtYf6mwl3OJEbsH7gbYyWiaH90BRS0NewjYkDMQT5Y9FFTe9LYPL?=
 =?us-ascii?Q?m1nGq9QzhSzwLWRdWNuvJwXDzDXQXmq8Y/v20kBK0ATB6PhrfKg6SwrKKVCk?=
 =?us-ascii?Q?8nGgoCL+Jo40pI3JMyyZsIy5l3klLgP0uJk9YNOu32UUiqHBZcJJZ2hLFpu2?=
 =?us-ascii?Q?tiphRfq6w4WBtO31yaJEjVcF9wbGbxLqK2ijO4e3PqJ9VaXEyjhoge6JvMd1?=
 =?us-ascii?Q?Q9MswFAn1FfgfsZ1J5h1L8y7tpRT4KFiiQHulphMXpqKAKaqizYlZuEI77Xv?=
 =?us-ascii?Q?MJKHO5pLqjERTH9/D21IIv3tpaEzuyKJc6cONj/u6nT+8r1RvNhbOvDHGgK+?=
 =?us-ascii?Q?99uQvnHRma7u4UQeZTSNAS4ssUPk+jx+QXoTORbPFQEwsdVsK6DcYMyNZMqW?=
 =?us-ascii?Q?/2cui1ns9cvvERf9OQxGRagzlQIOiyZMIuBiaZg25AgkCB2Poz+kyzZlHphF?=
 =?us-ascii?Q?ZSuV3b10ta0vYkz0nfH+OZknhpxYebIIZsZk9vN0NqvYaFQlFFCeL907R+w2?=
 =?us-ascii?Q?VrbEFTrSV4g/2GmB5/BoouQbxmu7Jd101WPyvJ1XSfZlI68nIJWGbK9U3aU5?=
 =?us-ascii?Q?X/6nZcQamxDA/PoBZoQzD1MKvj5p9UL5sFcV7Sb+f2HG/jz7diRqJvw84JlB?=
 =?us-ascii?Q?P18jc3f7Ot4vmBlzhs/F24MbVexXkG1ulODwvDYF6aXpvuDXMXI14UytL9OM?=
 =?us-ascii?Q?uI4r/cYTY+KMRXGhbf9QkRkPYmmSgpIpfpsjNM3hqxrsb0y2P2aDPKhKWA2j?=
 =?us-ascii?Q?NB/+1B7/vI2bjgDZ2u2sh3A1QAwRpy6YFs2I15egng35OUtAwKMoQaMlKGMn?=
 =?us-ascii?Q?6UHUlcgRvoCPsC6bTyBG0uSaoIRCNwI7bsdWqkNklwCdEj1OXjPcDRPAopLG?=
 =?us-ascii?Q?kGGQWtwzCDXdnxmqmy7OvJ4zE9z0wvRzMwVW0PPPjabMOJh/Hm+0PHEh8S/w?=
 =?us-ascii?Q?gTQSrLcw9CFP48wE2Z9/Z1snE2xduwYVns7ljVfnMXsU+uOo6cjVdHA1dTx5?=
 =?us-ascii?Q?pPfIyoJT3053qut3LpR4JXgVBI/EenyCICv6/Z+vKMe2y1iU3PvaTzvlMc6D?=
 =?us-ascii?Q?uQGeAYCqlLg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HcXHSEPz7mpVmtXU1aS2G0sCIAI0SXO9WQamnWWCq8Y1DFKQyuD855K8IkGO?=
 =?us-ascii?Q?sp0h0YeXOxYxsD7PvTIwXE75K881z3qtOtVNbFzkvgXF/wsXiWrAJMVEM85F?=
 =?us-ascii?Q?HOK03vn7An9LJq9Zo/1ShZjiNmidLOA2RduipTyMLi57rfx1V7/5TKGSgeG/?=
 =?us-ascii?Q?sYOuaCuqa7bVIFnd4A223N7VhedUDQaPr4E2n6JK5/u+hLwO20bYpFtA6iZE?=
 =?us-ascii?Q?lbyGrmdqgsi+qOfFsfwgITS1zmkSz1LGxYjCeXgqddk64a1c+Qwtls7MEadU?=
 =?us-ascii?Q?ruFkG5/MBs6kc3EQ3JMszfp0PZCDUJ8U0YnvhTOKIwzrX8njUj6yMC/0JL+z?=
 =?us-ascii?Q?dIKjAKb629zxuOzewXfeSwoK5e1WcFsgVCW/pjKyXtmL6suFS7js+U0tL+/6?=
 =?us-ascii?Q?9LX3mqR4pk6tAwkl4qb17eaRxbCwvHzJ9HOmp1rRX1tFBBJIdLWCDlxRozax?=
 =?us-ascii?Q?IYdiZWAJ35kIBvq23yXzlmFT+/xi3AP5Ec5BtnP2syZpmLibW5NQI56B9Cso?=
 =?us-ascii?Q?m+4WccF/9x+6OotAzSjf4RtLzMvhgzehzFbOeQs21WLW+vM9ST+3nZaLAZHS?=
 =?us-ascii?Q?ZP8cJFEQ+74oWS4nBeoJ3470tBpNpMqWqqgDHNarCphKRCiHVg323tkqXm6E?=
 =?us-ascii?Q?Zse7K0aS/dRhj56FOOTpzEX+vaMhv0zxdtdKja/PJU4Y1rlke3Qgzl+mqeZC?=
 =?us-ascii?Q?7p3AK+dKUZPWoZSlUpHiVW3AmJ019Yr0TqtNhl3wI3ZgqZ38lCDrCvDp621q?=
 =?us-ascii?Q?ruq20G/j807eY+1loLiSGBY4GDPEt4rhBrBZwdZmFDgcUqJtWWT4ZitP51Le?=
 =?us-ascii?Q?bAMdXzAnDMkDmc2O5pRf1bmqdyYenSQ23QoE0DXvcP0JY7kx9F+h+M7aZrVL?=
 =?us-ascii?Q?MtslKExJvTBDl2x9i0ab2KUKWLB1GZjYXoFM13dJtZI/jkA1th01pYcMcARv?=
 =?us-ascii?Q?LBucC6RTtrFTjtDG2lQgf1sYvdFcu3/JGheO9gV1bA7BJmhMgtfzExkiDDKX?=
 =?us-ascii?Q?491oACiMCdi4O6LBitui6hVNs+df1UE7AKiedl8W3EUSxFwLkn7akzXgobAn?=
 =?us-ascii?Q?ifmqLe4RUoKISZMwA0V0TmcNN5nfasCuuPgNH5gO01GEBhUpfTqeWZgCXZjB?=
 =?us-ascii?Q?H+EH3jglgAfqM2MUjKBDh0VyBlj9fvJ9xMK2d/Bg/qUJu3yuzTS+oxfTwxou?=
 =?us-ascii?Q?gokQXR39I6vKpHeJbh4E2JZDxkB9pChJEDSchbWvc3WJZT3FhOqDvUFvxg3a?=
 =?us-ascii?Q?ymEudQuRvHI9x9eC4DFMDhvwCyfcilf9ObZZTPaELVzqrnzcxyLaS0/1vL/r?=
 =?us-ascii?Q?0idxIXAhqC4g5y2lWUBI2/3XSvlrCWQzt04larWrhQL1lrVO6z7uY8QvA2+h?=
 =?us-ascii?Q?xWFKeh/MBDXxGVmi1is91Dflx5yuo6wBN/P/XVc4tS5v52BAesFC4YSbcA3d?=
 =?us-ascii?Q?b8rn0zmpDG/ANMPOAaoiDx2No8VP4nbWDdeeo+gBiJu9oZcg6tPq1qFr3ry+?=
 =?us-ascii?Q?s5YaOBNvFTmW8GeaxUQ1WbW+J1SvnRXPUdnMu/WvCw1KYJ3IJyPO4sqeLB8X?=
 =?us-ascii?Q?lNeR5AJs1dvPIhmtuSBKOJpwKWqcZ7Pqh+owj564i24WYaJvMJtcEVdhq1cu?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dz+kbNo9ICVNpCImjpvpPepDbK9raboQtbf20J6mGl/3qhb+jFr2SpMuL/l0gtvfoX66pFC4ZbyXSDrTvUBsK5MXIsuyPTGbdRaw3XbgOGY4GJXfP/ndplwXGoHKTX09FLo66FzoTUxPMzE0kMwceKmTEpk8ySbc89MggAUwDT+E98h2Ek2WByhIQJIKXY89BZGY/X3xbHlis0TVzqdL0+Yi5u0+9kVYxdhIK0JZJMehKiTMnY+5yV3lohd0Cksr0ez5AulBNR8X9b1kmUHz72v/fnsig5Ob65oqyrqAZqkZZxe17kiBVey0YZrU2oB3UMnMrnGItemTVx2WWr9Sh79ymVwMinBLh1+XhVNdrPRygSW3lCjOIehsVfU4wt9y3/GptUqnP/rqLIp00ZpzbgpOx/jcX9P4iSSYTCns/KSsA8ueLF76EgoVOpclmfyqpfoc/XOgt5rW5HcqhiChq1broKcrujFmBBoluBHadhJNoWj7nj7pC63wxtPzzetmJfp+B0l9fk+KUjBAEh3fUpspVxrvVLcwvW7pGhqhAEW/1fb/r0kdMnntrTp+4nBGmBwf3OlDQDLAGQE4+x1Bsxtu9vVsW5SUJjfOP1o3JHg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f352832-05a8-48ee-d481-08ddb329b9c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:16:34.9625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5bEPt1tkNN91kTlVEzfZ88QHlCQh6t7LLJ2PYBZPV5ZFmMRPwym9Ymp6TI2ZgPngAe2TyheGJGfVhvAGSfpjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240119
X-Proofpoint-ORIG-GUID: 3qAhMEjwRKWBFFOcq-yCjPO9pT68pTu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMCBTYWx0ZWRfX50Z4mHNwmtdx UB7UECOi8gxJM0TpQnPH2/ULsLZ+AJXZdGiSG9VQsJ75JoIaEy1zotZRekB3qg/m8kOt8yhovCT Y6/z/5Ja30kohJoAW0xra9LAiCopJ1h0qXTdhT2i2Lxv/mDMxbagd2P9IY+e+itTnadaEUJBX5c
 y2RXFuaeqaP4LheKrSImyLTvsMcz5pO3BtdsuWiI2KSSNbZ365Jaylz7ojqEFf7iSuBz8yPryIa ut3veIa36KIxR59uz2ov6jf5BPKZ/wkY5HZ3PgwQBerFOOiJEkY+Y/Iblb6Uz95VvY5O+ER/JIX 0jXKzFFMwLljr/bb3cPlEQbX/eOXoQeQl/zLlo3vmC6wBxHnkHKKhm4X8WUIFC+6D/hJu4jrW1N
 WBp/hz9BvMYO1swkCIyT+DoXW22jjEvqBP8Dlcx2Id/YuolFI9myyi6uEYs4GjT0Pm7PE1ia
X-Proofpoint-GUID: 3qAhMEjwRKWBFFOcq-yCjPO9pT68pTu4
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685ab346 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d02rggM92VoNQGpC:21 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3zi2ikel6atyXn8wtpEA:9

On 24 Jun 2025, Kris Van Hees outgrape:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo the spelling nit below.

> ---
>  libdtrace/dt_module.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index b3c8e247..eef5386a 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -864,11 +864,12 @@ static void
>  dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  {
>  	/*
> -	 * The first module for which we need to collect BTF data must be the
> -	 * 'vmlinux' module.
> +	 * If there is no shared BTF data, and we're trying to load BTF data
> +	 * fir any module other than "vmlinux", we can conclude no module has

s/fir/for/

-- 
NULL && (void)
