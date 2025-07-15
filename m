Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E02253EA
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575873; cv=fail; b=ilOo8URxOk4ie9xF8T6IpVkzsaAbp9z3WmkAcrM8EacvWKxYVqUKTfTP1dmuPiJ5g3ZioUKIksO6mwX/KwOFjhBVWpFUYa9g+NgII5vvFYW+r3ABSJ3p/4D8HNVo2sjF8rmQPXb0gBIGe2OtPtIqk+LdEC0hYCWxWvAVSmwbr7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575873; c=relaxed/simple;
	bh=rVpsOU5r64SSIf1YyoFyF2gDL5QG+1ooID8MJyBUJgU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Z8u0Lz7dtH92PlQLKzS9yybRC7ip+pGybfAVFe35WAxS2XGQ8WCIUjhnZjXqXxvdd7Sfsx49HxCPnb6goaCM/L6ZnS+QUm1yh8kSjRYlkHNbgb8GVmyngsExPWmv8LFz0sQbqOROSXGZmpA2s0bjjsNUXdCnuwRQAiYzi4OiwhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lEv/ecAe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yCNXQoQL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lEv/ecAe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yCNXQoQL"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9YtJw011813
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TaOiiLz0rXiHNLrEV6
	ZJkT6EFB2GGZQIjwB1Z2IfXC0=; b=lEv/ecAeZVBat3keDrr3lbYhuJQ4sp746T
	KzEiumXcsPPt9BjhZyG4w3/IEZy5OdWvvXQSPUTbcQD0iumOIuKwFzX++/FozuWw
	f0LJU1V4dbfK1LmXRzf7KjgB9VELuHyyBdhGT7kik3HqzpxXBBpXDB6SDx3uDjFk
	rZsCHZurTpgKD0egr7krrZv/w9BZVu24Qx52C2mCAMn0BL8BpC+mEhFpHngKIFPQ
	IehGl7rre3ojMjrXhJOEF27AEjfdhszYepEnu/DUshZ2WSDKAqhByejUVYyVge3y
	ftzcgLyPWOw2hP7cidvywsVWLq7Albb1Xpiiu2yRXXl3oZj9JD7A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4paxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:37:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9bdWq024636
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:37:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59sqat-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:37:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulbmuSz2ur5XnDcPekTjck1m8zPKd1UAzd24DzeqGHBzJ057/aVuzpdw/FotgAnRvyrb9LtN8Nk0PDi1ype/vJgi77IZlr57U0446lwYbc5XodL/ehHLOVJxbZTTAlIg8JAL3Pii2KXy4Gy3SxfejjN6Mr6Idp6bpnIxzAZ9vqXsE1W2dgAx+eH/dqRP9bglq0VHY5O5bHAuapixWYIKuDEKcTPjGnkOtQhQocvGuDmcZ8m8Sq8G3tkZFzKOrEixhQOYx6oMpiiBmeKaVFvIy3HIQYdC1n+UVCDYMORCqfW+hAaNrGr2KMWsOE3QOORo7JPZfGzMwMxj/DreyFqVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaOiiLz0rXiHNLrEV6ZJkT6EFB2GGZQIjwB1Z2IfXC0=;
 b=K6YQdlThE7uXrprAkpOgGQhnHnnz/6EsVbm1GoWMTD4aY+LHa+SgQSJlBMaFkRqMPiRX4CzOPwr+yMzQ9hnUNdooigT/ds9EW5PnVqRmZ+2BleWiba+OJ8QraDACZM35hzPVMyxO/MjoK8PUeNafu6rcVKrCkFMdIxoTQdx3zu0wZQ9r+VUsSX7qg4aAO8m+RrEUw1PqgenXeDJ21mqe9omPmneRN/v7fvr1qSaqpgkIjQJ45cXnVHt02XKMr+ZGMNtYaEOwoLIXIF/8irCYPgAuVRIeTiPiq2wr8y9diH2wumdH1XGiHQ8bKdc1BgctVHSI6vZQKK51BN3QfH1tkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaOiiLz0rXiHNLrEV6ZJkT6EFB2GGZQIjwB1Z2IfXC0=;
 b=yCNXQoQLWbSUeYij0ZBhJXTSQ9ktIcYmIzXEB3zgAZ8oDWVazgxM4TjDL2itB0ap+zVhN/LcFYYofhQ4CCndz8hXeUPBCYHmxcfygJVSI6RtkGiPjkFQ+TPqTbwHVIMmjkxxjh1Ew7GtsTponF3dPsOKkTe062UxvD8roqcbU+U=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DM6PR10MB4363.namprd10.prod.outlook.com (2603:10b6:5:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Tue, 15 Jul
 2025 10:37:47 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:37:47 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] cg: reject clauses using return() by default
References: <SJ0PR10MB567264A32C578A83EC920284C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: it's like swatting a fly with a supernova.
Date: Tue, 15 Jul 2025 11:37:39 +0100
In-Reply-To: <SJ0PR10MB567264A32C578A83EC920284C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 15 Jul 2025 01:48:21 -0400")
Message-ID: <878qkpwxho.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DM6PR10MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2de9b2-26d9-4ba8-f496-08ddc38ba3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yCBgh1Phk4XQ0LgAtfg4PdaKJ38PLBnijD5MPEdQMnd90qZXUS837xGnjdkl?=
 =?us-ascii?Q?pZoihNXWvVJwgMcdvCUkAbNRibr6Ny0ZVDvJc3n31hlMJTkpqgvehcH2v68I?=
 =?us-ascii?Q?zQqICgC9gbANJOzOsCnnq+as0bpwAYceH9o2BeSqtUfKKzWsg915hi9Jc4DA?=
 =?us-ascii?Q?nPPpl++GpNfwGnCg3DMOaIdscsI3C3Q2Zz5SBv3ameuUFP+pk5lKXQo6TxJr?=
 =?us-ascii?Q?y3+lOOcrXtEtSPT4VcsBthvNL1q31wJF/wPX5Dfu1tkeTW1w53oFYG6Gnys6?=
 =?us-ascii?Q?zOzkILu5RzI4CFXbVMmbQ3WHE/KMdvqkUpJktsBNzhKNixE7vRgJrJluF7X3?=
 =?us-ascii?Q?FCFZ1m55BN2lYXXgidmgsm8LYsPyy9WX7K6wKiSKb9AGjnKzWp3cktnlD2Ut?=
 =?us-ascii?Q?hz9Hh0A7KvTpIITG+20xnY6n8KqVYIdgZYBExj+HaFsfFF1TvaQU3d8HV1n8?=
 =?us-ascii?Q?fm58p8UQPTxubpn/KYZ7iiQik6CAR9wePmBJOWAhaqm47aZyJGelY7LqL/+U?=
 =?us-ascii?Q?rhk08jcFwEWHPqwtlF4TEZR/Cls3YmC7U8QGCBhK2ZR6xwruuHwhISpJs2Iy?=
 =?us-ascii?Q?c258w/aGEDW0qbFQRbLdBP0uudj6wektQQTsKL60XZ6uwRDClsc+vPDPO4mR?=
 =?us-ascii?Q?GrrGYRQiTHtY/nTv8IALFzO5oytPun/GXqkcvxT9IE9+TVheDbukdDSQJEVj?=
 =?us-ascii?Q?MU1XkY/GKbsIs6N7+ZnK1/Nb9VE+SSnH24P+4oDHDnUFUpcfVOdehmS5o6z2?=
 =?us-ascii?Q?K+utziG7NcWNJIoEy7zMZ9vMkypm+oEGY/8Jg2WoYL/5NJnh0FTW1IMr8DU0?=
 =?us-ascii?Q?01MfIZKPQtDC9ssWmgLrc+pHC/h/nub6QqXTTr/mc+X2iWSj+qWE+SPCZsqr?=
 =?us-ascii?Q?SsibeNsimh+OopvpKWR05uWYA8eOrHsJ7TJSqKehj7czISlrENCffSHrhIQF?=
 =?us-ascii?Q?dpTFCr5s3uVsF0B4Td8Lnjq8XZyjtKOdJQhhdSdVs28FQuJ3f7hOwKAAViKk?=
 =?us-ascii?Q?oApez7afIV9kHoYGXtnZJC//wZTT5Z0chiCKq0xDZvMG5IMuHKZ4MYItd5kF?=
 =?us-ascii?Q?eFahnzrQX6spJUJYQLcRtdwj2NBMieWzOZI+xDis5Oldw+2RRXXvLQNI0vXF?=
 =?us-ascii?Q?zbzew6NNXOEfhkgD5c2biEKT/NOiohjpJ7tFkvXpa7xsWQTB/Kw0BxN0GwBy?=
 =?us-ascii?Q?0IXmwBDL48VF5YF5kMBuQ+k9Y07gTKAS4A1Z9bcG4PLtJZgdvMyJl/blHYr+?=
 =?us-ascii?Q?cXmzDS4+05irgfluqXeVRHmuleECZ3Ap4R+0R52FITMGfThdvwiJMcGgTQ7t?=
 =?us-ascii?Q?ocwbtqS+dIs8xiiI6UhuMmsku2FZzWG+Y4u44bFPROfh+EP4lGJb7BoFgu39?=
 =?us-ascii?Q?iauMxMsjvG7V6MWNHjQOCUr8jhw7siLwqHqitGnrV/pKCSuCEkY/Lejd3apG?=
 =?us-ascii?Q?npgsEsEGVzA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cVppPds+Q3WVX36/GkihF7bsO7ioFD6ouK3chvRat1KdZQaxvxIAzBf6EIqX?=
 =?us-ascii?Q?cdN7UgFOvIqjOY29NIRTnainRSiO1oq3rgUSIZmqAwZkOjhdNxc/rNiC1rRu?=
 =?us-ascii?Q?AQHAwYgYhcncpqG1r5vns1dMCXfagSH4FCGNYufySVrH8BWZoQIcqVFrn6/X?=
 =?us-ascii?Q?tZHnckLnaxWj2VbHJVHrHRpZvsLXYSpbfY20wFi65fgtZuagXdXS24zxMzOi?=
 =?us-ascii?Q?uLFSC43mU3VYF1xdUrnJXQZHTydr+hjxjd8kSxSszROrIoEDNOx9/3VAQ4fM?=
 =?us-ascii?Q?DNBexqRJrevoPNBvrZJMu79ERbVQAfhAeBsENTL9FQAlIFLeOoKvNrxZ3ZaS?=
 =?us-ascii?Q?VOjrNkl/WxyA9LF2G+EzFwy4VZnQ4bFpsYahLH79np00Ya1dwy+mqa35LGvc?=
 =?us-ascii?Q?qZWyH549hMEmri7tfGQlFG92x48q15snktM9TUJZJYVLjlC807Ktx17vdkwZ?=
 =?us-ascii?Q?NFnftBIetAZ6Kzn3dDj/dkUYrPpy45RGqCqz7rycs3b/OTOtKJORjW/NH+vr?=
 =?us-ascii?Q?NKOiD/17QU2kMcvLt+3EPC3IH5ucWFfLXlFDcWjS0/BPWVS/cWbkMSrtDUIH?=
 =?us-ascii?Q?nm1H/pMSjlyhjXC48RGk/vNVvFvUmwi2QgvqQ1Z9RSiJ3DqRlZdQX6r8+Nam?=
 =?us-ascii?Q?UKNHuD1FfCAE1magqUxE5p0sJeRAA3dEk9xfXxi6T1Z8IQREPDsiBMqOyb9O?=
 =?us-ascii?Q?lKnV7B4ngncwI/OmfSivejCZuGVfnTS8KT5S1NKtwqT95W4rLRg6SEAHXdQl?=
 =?us-ascii?Q?vaY6PWPfsasKtLTmXNWI5nI23cz54GXflc5y8uPjWwEHCu2QpRvOaGqHUAr4?=
 =?us-ascii?Q?jDsx6LYd4cp1p4F2ftxWleeC2dxOAduaWZh29nvtJN/wLTGI2N8v1/cTWMrF?=
 =?us-ascii?Q?QNYr9jdUNwECMjZEgW6ohBy+9G98bzyIQZvLO2gF4XCjMn2rEzOmrCx1ExSR?=
 =?us-ascii?Q?wx1vMjVaadrepvV2rQNpU40L1cmNt99EPPZXaqxyUuzER+umzFEBax1Cvhh9?=
 =?us-ascii?Q?bWFlm7LvFto1TF1JtIBvw1qA3IiYqfxlP4r071H/GCMbmqdV59vB6FT9FutK?=
 =?us-ascii?Q?Qz4wdvgIXhKJWBvfk0upbB3Vx0nd/3KMQSpjVuxuxvMgPlGBZR8J3GLirMLE?=
 =?us-ascii?Q?yM4W1KpeD/WyOnEJVBIPW4H5NEePXPyjiriZ+c2sNCNiPJVv6LYVuoDPZWBO?=
 =?us-ascii?Q?60D7hbENP/26ysWb9tzc9YYLFoBS4PKoa/6S+p4ChOfareBkqWC++5bT3Bs/?=
 =?us-ascii?Q?Wr3HbB9z3RXx/ejIVjod9n1CzNtkNWx6AhdzEZkapx5u7lf3iCLrEA1X+j/m?=
 =?us-ascii?Q?a2NF4qTHl+CsqFokDNX/+1ifsjrO2tGlRfJVNqQk3aMDjscnbRnW3hxoadWP?=
 =?us-ascii?Q?hmE8IikphDnkm7CIsLUorFqr6MgmnZhat8h90/CQGTGXVI/AhhpSAlCUKuf9?=
 =?us-ascii?Q?WJf00i4fon3vrh78+bNySitDPnfXz3pYcx6liIGDLhckAYfrBDBSacxRZzmW?=
 =?us-ascii?Q?nSg7Sh8yYlKdCr3X4Rz7+Cb14fLqLj/mKJV6t0F48lVhowKQbh0qZuPWM1U2?=
 =?us-ascii?Q?VXXxG+ztg8cjo+Q52aJxBy+FPsyIVEFeYDFsZCvv/4LDhon2zBPBSPdoAOjb?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ThGLaPD9pk0wvO0AiAmUjp2MzA4WOxAlNbGCLq28vIVK/6klPkQ12fXUWPxJ99T0yMHLAJkXd5nv+Wy6qPrgxT9XMtH2dysOBrSpO0YSqkvsKuaAlgle4ilQGUz+cgNGquhIg5Z7pghWTiFdeJnT3viOqZxA0mDhWC5WDUAfNuCmwZO8875aSa+ledEZ+tq3gYNyBVzPV+7LhR1g1u6HP3nFDpamKwTALSFoVwTFnOzkTVbqbx7CECLKRGYevjo8dtP7VSUaY8TlduPRiLmJZKWdEw4f7/AYimC5zbKqvh44PTIot1Uh0kFt1yvViVWB3XoyhKtCwx5ukogLM2p3etOtVuD3tmdhHbQvEuDK9NbTJX9yowjIjEZ1dQl2d+TJ0T1yS57Rxl2C6c4riZXC8gM4J8dCz1OkPlD8/1gh6ubjEJtJ+tbKEhhIjoDjoNhrwaztmzXchFz9bunuwfxsZV7EoGwt3lW9Ry9Hfm4I4lYxepYQE0aAiYMx5BrtCVa2V0QmEZSeaIKQsW8gVzsF23lRrVYvyqqJPw4+lIobGqFdj5/njIEKplWuoLcp/2hEksdzMNLEsXHFiJ8KsORpK+GvC/5VPGIgMttyIHIDuCo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2de9b2-26d9-4ba8-f496-08ddc38ba3dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:37:47.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqllCSDbkWRVM7Sm2/z+KYNqMIfhnTazzB08l95Ul5YIuIIqas/YK2TGBK/NWK2pov0EKlIcHoCPx3NU++ddKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4363
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150096
X-Proofpoint-ORIG-GUID: T1KDnfwTUZbb6Ix_dEAC_Bvzt6OUmrix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5NiBTYWx0ZWRfX/qa4KabjzShy UEp1if2YiVTukL77VsXf8zD2of3ZD6jTowlPK74z4zS8lCPAHX26Or3002VfGpESTAKCBfF3Bju DZasoZ1i0zKBuPMi/oxyjI5NwjojibxyyOPmDvdgctDJ6wA+OfQYF8wYjgvoaoNTySu3QYRRmEz
 Y4r9V1xOcJoCD7eV0PbdqN/iUuS4a5SAVehGJs5nPbcqIv9FwqgAqxXItbWsTurCJT3VO9Kc04V Qw5v5SNDBL/MeeY5NvBDs5uf25j/pgM6cYh+G3Sw1mpXf0mMKdQpCxKzI4IzOcCUzZKAuGi0NRD HCSKxBAre62HzKawKZ19t04K2dPqRh6RAo8dOGQH7viL1fB6xktwOF5f0NFZ7PfT417T6f4djrc
 MCufaoHgE6/Tb7iTlR2ItFqWTW2XTQJyjbzIERt2dhiBxsQ8RNzW6boMjhe1znERpeZIeUQn
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=68762f7e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FKsuRDeYOqlfO7jTGCYA:9
X-Proofpoint-GUID: T1KDnfwTUZbb6Ix_dEAC_Bvzt6OUmrix

On 15 Jul 2025, Kris Van Hees verbalised:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> ---
>  libdtrace/dt_cg.c      | 10 +++++++++-
>  libdtrace/dt_errtags.h |  1 +
>  libdtrace/dtrace.h     | 19 ++++++++++---------
>  3 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 738597ed..0607cd4e 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -875,6 +875,10 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *ar
>  	 */
>  	if (prp->prov->impl->reject_clause != NULL)
>  		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
> +	else if (sdp->dtsd_clauseflags & DT_CLSFLAG_RETURN)
> +		xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
> +			prp->desc->prv, prp->desc->mod, prp->desc->fun,
> +			prp->desc->prb);

Ah, I guess these are the "default checks" given in the previous commit,
so you can just set up the reject_clause() if destructive mode is on,
and not need to check here at all.

> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index 20672d3f..f0c1b8dc 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -154,15 +154,16 @@ typedef struct dtrace_stmtdesc {
>  } dtrace_stmtdesc_t;
>  
>  /* dtsd clause flags */
> -#define DT_CLSFLAG_DATAREC		1	/* data-recording */
> -#define DT_CLSFLAG_SPECULATE		2	/* speculate */
> -#define DT_CLSFLAG_COMMIT		4	/* commit */
> -#define DT_CLSFLAG_COMMIT_DISCARD	8	/* commit/discard */
> -#define DT_CLSFLAG_EXIT			16	/* exit */
> -#define DT_CLSFLAG_DESTRUCT		32	/* destructive */
> -#define DT_CLSFLAG_AGGREGATION		64	/* aggregation */
> -#define DT_CLSFLAG_USDT_INCLUDE		128	/* could be used in USDT clause */
> -#define DT_CLSFLAG_USDT_EXCLUDE		256	/* could not be used in USDT clause */
> +#define DT_CLSFLAG_DATAREC		0x0001	/* data-recording */
> +#define DT_CLSFLAG_SPECULATE		0x0002	/* speculate */
> +#define DT_CLSFLAG_COMMIT		0x0004	/* commit */
> +#define DT_CLSFLAG_COMMIT_DISCARD	0x0008	/* commit/discard */
> +#define DT_CLSFLAG_EXIT			0x0010	/* exit */
> +#define DT_CLSFLAG_DESTRUCT		0x0020	/* destructive */
> +#define DT_CLSFLAG_RETURN		0x0040	/* aggregation */
> +#define DT_CLSFLAG_AGGREGATION		0x0080	/* return action */
> +#define DT_CLSFLAG_USDT_INCLUDE		0x0100	/* could be used in USDT clause */
> +#define DT_CLSFLAG_USDT_EXCLUDE		0x0200	/* could not be used in USDT clause */

Oh yes please! I mean we all know our powers of two anyway, but this is
just cleaner. (Not sure why you stuffed DT_CLSFLAG_RETURN in the middle
like that, though.)

-- 
NULL && (void)
