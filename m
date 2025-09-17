Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FDD2F1FFE
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123014; cv=fail; b=AEGFd3Bi/0ceV7KOjOdRBXLfxQUNL1oh9/C4Y5Z5Tu0y2QTMsedL/6i1/iZfnBNu+v5pUGdpxBD+HhmSNLDOIoYOi38yNDRtBHf4NPAJTO+Igj3rXa0G8xICzzCNYa4z2HIfgO0n5k/sXd29YzfNRwaKcgw4PWv65xJ1j79+KR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123014; c=relaxed/simple;
	bh=yfMytjOHI9IEWuVSMMknig/neZ4rMAnSKtNLsLprGVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gf7QURj20jSpCs3NUq9CUcZ9tUHTthupB+OHAPxeT0IBm6bc76dyNMi1K2SsMjaPN+91i6gXkmb9GUaPRgh3NDCqwy9hIFDFhfRACKdUkrm4/IWEhxQ+uuDUsLAzZgJL/VLBU0AiZi/ezYN9JwxmFvGNZQ6mTiTX3FNRaj2qiSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XqGZ9FY8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fAzxKnqf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XqGZ9FY8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fAzxKnqf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEIUQl010040
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=06VWMbuWsCL7vx0wfk
	RcnLjd22TsQkNKKIhaoqY67rg=; b=XqGZ9FY8b0TMwB19sMqJ7i01XK+cLnn07f
	SwIfxL02iVS41CsmVdv2PMwNy/45SPx6mglMW0vrY2uMeikbh+Cmyfc463f38Dwe
	0S2zU3gLnYTsuUXoJ0hfNyns7XVWjSpJrHA63NpmOUD6TgGIZrbyo2/4TyWh5/S4
	Wm6f+dBlpVKPmzWdvfbduKQGEuQ7s5JPhBVxmZ4P4uruZ103aVTcR0oFx66xuTeH
	dxKYhcK+jmzLVkP+O0JPt4boGexEhfZ4J4YguYDPu0+Sk7QxSqgZQVxiqzdEcJ6s
	crJC8l2nHIU9TS87C0i0eTQ8Mz0BeYoL9eLldG8p7H2hytn81p/g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx6hhss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:30:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEP8jU035202
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:30:11 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2m7xfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ2wxXu0VUdudWS3b2eCFO2JHbzIlkx48czEcmjN1qk8NLSZeUMi0ZPz7JbjULtaThWZmqf2Rxbd7BwwVTgiUKx04yz8PCw7potX9//UJTQ3YPypS+Luaiyl05nBRsFiiW3Zvgx+MsjYU6H+4SGJNiSwBYzIiv7FurBWUQrfzx19crx7HX/4KG/tsdFsiWNKTgb+69J9yVhX5CdPyBiT+G7h3mzDjvUOXuCeJjipI4UGvM9qGoZRmffmALxdXov0DuF6gU1T44GggCGRG7AZgk0H9CLtg3lHBo1FTCdY47Odg1i+GsVnxCRAnClKPyqS63SdIpr1nHbMsVzChi4Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06VWMbuWsCL7vx0wfkRcnLjd22TsQkNKKIhaoqY67rg=;
 b=vrmKVuvJAFg0kv6s2C1+L5liZln2TCzruE9LwX+ldBCffmw+lHJ9zIkTxq3lxK1d124e0TYA9BQu5JS1Qo1H2OrMDGzeAFKuNUaoxJp6VENn+2ZW1c030W96zybV1L8emr6m+fKIuKl6tdO92dPEW6JcwPmd14rN5zdV6yg03trXUOWxrpxjecXPN6yQ7ZF0R2+cKO+quBbTrIm3Ummn8duV6m9Ce9rkZbF2sZCnuycuv9/RVHOtWBTHyWN62ev1PNowDOOA8/9nPgW6muOKcuvn1BktAO9hNjHjv6HnDbpmttuhQ4a35BMO6CcpazVhKo9p+cFdsGiMxiV55UprKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06VWMbuWsCL7vx0wfkRcnLjd22TsQkNKKIhaoqY67rg=;
 b=fAzxKnqf7n3/D9QVdxu7zQY92JZciqj7KWI3XFrbqTSkR5jPRRXe5qVNqz6hDfZu7t1QcvXXz4NtokOqmPibWKtgUhb6sp/mmc0AFHXpaUW/uSXv2z3oMBU5+iF7ffqMBPWM4XKlrW/vrnuw2A7NJ2MO4sF2/KgeyFU6vH48nEc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CO1PR10MB4435.namprd10.prod.outlook.com (2603:10b6:303:6c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 15:29:37 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 15:29:37 +0000
Date: Wed, 17 Sep 2025 11:29:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4] trace: print alloca pointers as actual pointer values
Message-ID: <aMrT3t15+evn9bBR@oracle.com>
References: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87h5x1p1dm.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5x1p1dm.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CO1PR10MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 277eb648-dd09-43b5-2814-08ddf5ff02da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TqipFwRZxv80KMSfHil2qKtt2J2yfDV6PUg3G0efiJ/SXqDluJu1Eid6ydMW?=
 =?us-ascii?Q?hcoK8yaaa9L7oY/lCIf5c8hFrAvLHY+2qv/YjsqVMq86tIaATsxyLlNfoWRi?=
 =?us-ascii?Q?rzcjPlF70agmON0PHkotNZgiZeAkR1kzWgJSgX+UDjJDgeAeY8N//kknFmOZ?=
 =?us-ascii?Q?13p5VyWQeTej70udsjA/FD4oUBiCum5/YyjL74HtwuCxU7+1m3egUSGOsNT3?=
 =?us-ascii?Q?x6nNS1cD/ML0a2VGLZycvJr9MVHDWzqjAZ2DUrkVhPtjSwvugFJdJMf0Uj71?=
 =?us-ascii?Q?kdy23jAg0pKSKAbGsHJJ1Yw5YJZo8o3e5zqv5HwKgkT7NQsPxPtB8xshizjq?=
 =?us-ascii?Q?FV/u74H8vuaHDwmDmy4qgqSrUOkfdcya7Gzu96U6Krs9UnIEw0squWYHVcTg?=
 =?us-ascii?Q?vSlFomFBFWztW5TU2JXCxcuwYfralRCY/FCpGhr5rkAD3kzm502URDkbbpAL?=
 =?us-ascii?Q?IUQ/7BmUBbmzfnKPTjyIKLH8hOOh2G0E3rIY5debwRx4w7RvFYqKNCIIAPOH?=
 =?us-ascii?Q?XkLUsJsxOiWiwFtf5ZSCGIzgpT6h41dMUJXzKP9phe4GFq3CP4S54KytExVb?=
 =?us-ascii?Q?nCAoruGchGnDbf/inckT/m7CcBceMx6N50m3qeLv/AJlYj4RpK/tLkwphzi8?=
 =?us-ascii?Q?QC/YRLprIENK2EMVQV14YA0ihbSp+cv6IxmHoi5b55ICYZuwR/Sewx0nwFlJ?=
 =?us-ascii?Q?PECCRRISfWiPCS1+z1I2WeMvsWz7SaF5Rp3787TpSiQBbi8EOJbXAFythWcS?=
 =?us-ascii?Q?dZxQkTfv+/CW0wRL9BNlf9kCK6XROmoo8atmn8ilrn9iby1t3xMAn7ijLSOd?=
 =?us-ascii?Q?dTU1k1VFyRfX47ELmMhrSCFGexApwZ+4c96QHpEqfbwO+BnwIaseRxRwM2LT?=
 =?us-ascii?Q?QivppUyft/AsHwnGa3PzdXwPDt7tjItcU4eUs6ZvjkEIpyjS4GR57e9XxTOH?=
 =?us-ascii?Q?ksFvljoMbJ0pnbkRVyyNPPqxNV6b7Q/8t4N8SeOQx/ByyUfkXhmqjGR90q3Y?=
 =?us-ascii?Q?GEKPVMbzCmJbJ7VOb4/bySGeABQOv+UvCL7tYEJPeawJkl6rsG54/zI4EuwP?=
 =?us-ascii?Q?mr7mYQzPQOWnoF7XMQEN+uJK1VDRwDUGVqccV2QDZkSLwyV72s51ucpXnFR+?=
 =?us-ascii?Q?EcWob6qSNWYEe9wR8+QHw+2w33PgXBuw+wsrAuKUe6uZXzLRYd6SFakh1u0Y?=
 =?us-ascii?Q?A+rogyAEAfUlJH5s+nQHojJdYrPoeLMsJC4hmDmA62D6BtuyK9sdq90fkGnE?=
 =?us-ascii?Q?vzXD7wFsRJKgkL4hhKFFndavZGJ3w1HfYsUa1xeTvnOcIwlhGr/+lQiZ35cL?=
 =?us-ascii?Q?LPeT8/RfUFmugOcuLWpvBBTKUtE8MVExmOlRLSoDV3lRDaB2OIFbYlhr8EAJ?=
 =?us-ascii?Q?zMUvSIimC9LH4W7qaT+zh5ZUycQQHvdjvvj8Is4Ierz8KJnxUsg/ZjTx7ewt?=
 =?us-ascii?Q?wMgP6RetZYU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3i3EFTQOYAdwplhax87bkfsViZ9jvPSx6IF3KJgZ9xJ+mmqj+LaA5oD6UNgW?=
 =?us-ascii?Q?wJEHQ6wLYabBDpA4sXbtbhTF8Fr269ZzlCa6KKvvvlrqlAac4j0pLz+iGcze?=
 =?us-ascii?Q?TwixrCrbkXNzcONa9sgZ3/jloDSakl8UR2snkQMe/ADImIfTktDIIwZQq5Km?=
 =?us-ascii?Q?60GNooqEhjOPLV1Le0AbAAaca2khqy6+Dd9712d5+R5HXvuV/twHRmCuC/yO?=
 =?us-ascii?Q?au/GqPIL1PfKeXZO37k5X+azgnm1BnS9jfFVLILpIyB2seAZbfsfB26OWoHW?=
 =?us-ascii?Q?+Js+eCabPTdhHmlhUmJuye0atMJQ+o+kO6KgB5eVCiv7KxaxyNMxSlczMOfA?=
 =?us-ascii?Q?5iUXhZ72fC3yYmwUnONa78sK+E76h8RU51FSFQhIU4F9FLLlSG1+4B3ZDN2z?=
 =?us-ascii?Q?BxoFiPgrF6IzIak2C5X3rgUp2ZxrfbrNiVF34dMaKaPTKqWVqw/BBd04zM50?=
 =?us-ascii?Q?kYQw814SIiAaCIQgdqR6TXa1FnPWQwF88taX/Dk6raVkAYaPhZ0xfaF9eKc2?=
 =?us-ascii?Q?XB85NrfdQYPsBxR47P2q/b6NAZv/8HlZthWTI9ey/v8B9sgIMwVVqcz0S3Qp?=
 =?us-ascii?Q?63vMfNxZIXTqnXqjSFYoIJ76Iwoiq2E5UVxzqT8UuFS1ua55eQUwTkrS8GYk?=
 =?us-ascii?Q?UHqQkcU7PSj1MiEQ6skAwBmC9l1aoZK11rQAgO8RtmDZBchrSRSYsgsAWUJu?=
 =?us-ascii?Q?NAWzMxp5v44Klfs9gHKWg3qHpWGgkioUMi6S5yUpvNrp6q/X5EfcL/ZxW439?=
 =?us-ascii?Q?GFV8O04p1b4IlZsCx4mOJ6u2FVPUdni8lqIphKb2H+Ob8rlAHlbwbezMZaeO?=
 =?us-ascii?Q?h7/G4ZZQ5U0mX4ruwogNpr4Hs3gUf8O+ogXqaMV8SeafAmEqEom7PYt+UrIG?=
 =?us-ascii?Q?wq/9jFF7olq+5alNJ1lWSEDbmtogqVDmxAG3BxPU3BJjXg7qHOkPfB42d0vB?=
 =?us-ascii?Q?Gh4yIF8xwOI4LZcLfpIRXsZ6kUTAPsz3dHrU+w2vilskw/LGBEn/xW7HxJHn?=
 =?us-ascii?Q?gIyB0iQerUTjrOa/iZx98xWg7scYL97WSf95HdqBMVBw+/KEVrWhQwSi+lFl?=
 =?us-ascii?Q?DXAlPHxKmK9Aj+Mbt9oXwiUStO8oOettF6DJqiwIA6QqycGwcfhXsqm0Bgvj?=
 =?us-ascii?Q?wxH1sZ2SV6VkGxCQ2wV/5fXEvojg/WbgWNDsxlRDWk/dj8mlf/UIt2TQRqod?=
 =?us-ascii?Q?QF8Ey5q9qsy1cV/0EHEaOmVxyIJDW1HxQe4ADs0DXwf/N4Jr8NAxY3I39jiD?=
 =?us-ascii?Q?EUywzPWIOF470ndeCM6+WvtgGXAa5CJDigOROt3EIkyx+Ue9DB3nfwhhNwG3?=
 =?us-ascii?Q?r8X+M/ALUzCsyrq7JXh/X9DXrpwG7nB7SNqvYjtgt3kAYjUfkuOHy1/FTv4y?=
 =?us-ascii?Q?HwrQdn1zqMj1hXEVF5lyB5rk+1s6kCqt87R/F6hsniF7M+JcgyZwnjZZJ6i5?=
 =?us-ascii?Q?E/NOR5E+S08IJsAYi6KJqffGXBUc5d6AeWzAUi9tZAR7kufeGqwsQMWfw8QH?=
 =?us-ascii?Q?6F3oT0KCHei++TvTkG5zdl1aXHYcyn2NZm/PlZaas01DqeCbph9+wXNKWPBs?=
 =?us-ascii?Q?MVTHCxdNH1vA4X9yzPAgEv5JMiG1Kyhz3AkbTpg94sZBqyMXKTfIYtR2Xmky?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ckTBPUbP7J2sTdKqLjyWdYvdx4+FpAM3rSQDeNRZgFm8dgJoy2Iwc54uyDTKg/TziiKYgXef9iT17xrhsa2Mf5jFv43GmiDaYKFrZWckOa2W0oSGTURgTtO2xvGwbWaarvYhWm3POeyEsv+Z9TBwopv/FNhWdh8qgr4TUxBCiQwBnSdvKe+6sy876EEyBnrYHrr64HdfKvpn9QcMn2rbB8I36NktKQ2iAu6F/oAQ1WCnzmQQbV/LDLXzhbsDH8P0f/ebk1Bdx/zhj31mRiIprlT+4sHS+AJL8tF/y6Uco1PeqYLsX6KknCWva+oDHsyw6JLck/Gdi7tHLfj4MurGAKQZNhoQuCUr5VRZuWnCEWi+p1BsIPNbmuZ8yq4P4YFKUtXOPhaDbE2Xis5uX6O3VDztNjozV2cnfzqaB6jRTJyRpoB3e67e58u/wXUx24lvhz0d7nDNuYNBCyNizb04pB2djuiaQv4VApIkeALdaBw2K0sXf2OkQnWJZjHXcR68wj/VmQrA8tu2IIPOXjnBDfXq4AyGUqhLscCBXbuZQr6ckNaentxfClvlpbaGQXBxTFA4E8Bu0BDREULhVqXbmLI7LVqStZtX5OEZBlNfLSc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277eb648-dd09-43b5-2814-08ddf5ff02da
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:29:37.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCuWxilrTB7k4rG6X5AHiIvxNGPwZJsaziQ9SveME/i2H/HNwKsxkAnAvU14wpmOURhziAW+8iquhEkO6Q4uBLeR1XyrXnVXrSp/wv77NlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4435
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509170151
X-Authority-Analysis: v=2.4 cv=TqbmhCXh c=1 sm=1 tr=0 ts=68cad403 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7uRrseEIRbgz52KGXsUA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13614
X-Proofpoint-GUID: SIneguh81AppoDycw2SVNc1tdGvTpFPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXynsDS6riLC0D
 h/EobU2ro7ufr8joqy2Hn8svu6Ij3FPzNK232CTiMslGVEpQ1ms7Q+2PXk1tsQ4uZz0oc23XxzE
 JGndmHnXYPqBkvqqS7zKzkuXJiqE0YlHs1yWD6oD327PgyzWuenfriDxwFFqeFT02XO2SfkAJC+
 vfe3NvfWbGeLg1fBPUv7nZME8JKWrD7Qaxuwvo0U+HkYbghHp+rVxs4w2GCbuHwOiJ+KQctehK0
 /dlXwK2h/i/m5sorhryNSFTLz7Av6MV16lpF7GB7gA/rznMNFHu83oXUKvUA3wi9x6YZGgEyJcv
 ejhgrvJi64Kod+r9B1z7eBf5t7QEo/67j0fliLtun80ennR3pvKW6iX665y7/P61KcyzqsDopSo
 /nnQcVgpRJWhUu27uKKH6ik+48ogtw==
X-Proofpoint-ORIG-GUID: SIneguh81AppoDycw2SVNc1tdGvTpFPd

On Wed, Sep 17, 2025 at 04:03:33PM +0100, Nick Alcock wrote:
> On 16 Sep 2025, Kris Van Hees verbalised:
> 
> > Because alloca pointers are stored internally as offsets into the
> > scratchmem area, they were printed as small integers.  They are
> > now printed as actual pointer values into kernel space.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> So... the change is to generate real pointers for children of alloca
> nodes too, and scalarize more aggressively? I don't really see what the
> second part has to do with this change (and more specifically why it
> didn't cause problems before now).

It doesn't cause problems - it is just not what should happen.  Since an alloca
pointer is a pointer into kernel space one would expect (and legacy behaviour
shows this) that printing it would give us an address value in kernel space.
Without this patchm we print the *offset* into the scratch memory area, which
is certainly not a valid pointer in kernel space.

Because of how code generation is done, it unfortunately requires slightly more
complex logic to know which values to convert into actual pointer values in
order to store them in the trace output buffer.  An extra complication is that,
if we are storing the pointer value into the trace event buffer, some versions
of the verifier will complain if it is a value that is marked as an address
into a BPF map.  That is why it needs to be scalarized.
