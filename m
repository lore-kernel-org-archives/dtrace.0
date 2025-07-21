Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357618C933
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753137419; cv=fail; b=Y/dgQrGc5np2g/99kvrDDxQT8h0qTD0koVSkYGuqaG4NvnS11QKt5Otvr8eAGDrtlPOPMGcLVFTYapisSqIM18Th1rDM9i/qoWY3BXb6Ql1ANAUCmgCCw0Wa2Rly5aU+0syBIzY4Ydobwk10maHzCaUVLZ0tCpl536Cs2bhbMgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753137419; c=relaxed/simple;
	bh=pJ1IlQDAwRUoRNiz0gsF7rvpZ7uMqtp3bBcMCFw/46k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dqp+xz0vbH/TcDCRQyvPttBRRCcitmGLhOYKSCbQ4PVKEKkpB6tXQUABYcA7oE57Q6WkwLq4ywjpnr7iZpQTbnqPUOSmiVkFTVYamq/NjW3mdE1PWit7arhgYW/tcf+wN6HyodbfflIdOV2j4/AsXfo3sk3eBZDUWLgrLWQf7eA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T9Cbv9nZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vpgUlb+m; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T9Cbv9nZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vpgUlb+m"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LLMlWr009735
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sxe3atAxojGLYI6+7o
	rHAtXK8rBKjKHSSAnJCUvGbAs=; b=T9Cbv9nZ6+4LNwY0zXfI0xTzszKjT5LPtM
	HHabMboQixlMvZ9V5nAfVPI8bQfL8rPoO6Vj0+W119AUGT48+3Ah3z9fFp4U3gix
	x+n2TEsE1OiyEJJWUpgp6endfzozKe7z48ayIJRH6HpJJTvNp19S6C/FNQdyDCDe
	ouqV9/Alpu3O678i16fLWJ9p2pZzvdu/T+CYLo+c4HLFIbHeMyyWIHIK/0HBed18
	xqtWXlXkLxKpogqo34zukCOpWT+CZN9v+rLB8Twr4jT5X3+U0vxYehFnoahtKJj1
	mQpJ9X/e7WW15m3lrtfj5C2fRgGS8pl8CophKTJtn144CPYfSpyg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576ktvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:36:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LMG3WK038305
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:36:54 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012011.outbound.protection.outlook.com [40.93.200.11])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8m4sc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 22:36:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wb4ewcsH7X/1Qlt8BzDn2t3ulSXM18BODN+7Sh8ry287lLiC75FUd6545v2b1UqR7BOZR2URMZODpz/i5Zo0rWibv+tC7PrMmwlKZQ7c1QTs5NHlFLmWApdLK/jlG7/UcMo9opVy46IUZ6NsiRJ1DAfb/eZNZmB0ru+UZsexUWAeRvYavJQ99F97WNJNDjOGtgyzPCmP05C7YKoeY1KAF+DXe8bfhtj3cWqXmQ8LLDA7broxWXsUmpWTq6/DrwnFizZysIQxQEjdPdKRQWf2YBN/GmKEjYJjTFl61OmgqTtGKWUPPS9Y+eDkhzU+vgNQd/1IbP68Mo6WPIzlVLY7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxe3atAxojGLYI6+7orHAtXK8rBKjKHSSAnJCUvGbAs=;
 b=bp5GYOwwncOf4+5peRXqgH9KS9uNYfjU9az9hrykuYE8X4u3TVNamnvjgxI7G5eCNUe6dn2D9p0JlGXK0WofY4RTC8QI4MorANaDRHXxlh8xYrZbzQdMocpt/7DcbJAKKCgMLqi9/zBo5BXM8aGAD0xk8rx6vynbqeMOWQXBwZpmAjwu+dl5Bib2o99cgefm7LlFsHbs4MOZdKAsnkDyBgqbkL2jTGSME5vCqOpmesn5yLI50WEZZz4kIwzmgUlz85AMeWI6qk3ZCCqdbaPRnBShD/+HavzWPf7XBzkUjxPYllWynXe9rmli95LWZfw3vq1W137zzT5doPelmBjIOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxe3atAxojGLYI6+7orHAtXK8rBKjKHSSAnJCUvGbAs=;
 b=vpgUlb+m7T7N3/5lll+6P7LTMqGeP9yLaR0ufF+sOZswjZiElxwm6lpsSj1c0NPC7wBFBfHp9NehWpy6g3B5lS+hElz47tQ5daPxweBH0gbUXOrzcp5SG114L6v778DuD3prNkmIARAjbLkUnyWvY5dcVOLVIIee48IRhokzODQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8540.namprd10.prod.outlook.com (2603:10b6:208:572::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 22:36:50 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 22:36:50 +0000
Date: Mon, 21 Jul 2025 18:36:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 7/7] unittest/tcp: update test.x
Message-ID: <aH7A//X7CA1HM63Z@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-8-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709144700.20591-8-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: cd38617a-d48a-499c-879d-08ddc8a7157c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k2Ji9RyqMSJmHSBkoBEm9nblCqmNJvGatqEchLN1najid+sBVixwCrbZklvN?=
 =?us-ascii?Q?yxzq3/f+ImmY16U+ZjBXzNUJ0ot7+DjUARSURAR2hSIUJ5/h36F1PcjJlprm?=
 =?us-ascii?Q?LXIO9mtL2PISe2eFT6vIg9ijR/LHjdDjkMls4mCdS6ehwCoF96MJlpw0sNm+?=
 =?us-ascii?Q?3bSue/+BhlAQUlBGBWjFH998iAyprsdQucoHqo/igIDXKQnArBddnBOy3chy?=
 =?us-ascii?Q?xeoLcNGaOqqaThXxTs2gdCTyzxYtE1MwRVLaEU4AaMeBmc5K1wDbAvm8U3+v?=
 =?us-ascii?Q?dabTpm9BHL94L+Dn4XINoGgh0hV8QS8SZ4sUZ1VsB2Hb5W8K4GuXI5Ek/obu?=
 =?us-ascii?Q?Ebh1JDB1Yxr8yk2gSpEep9YJoGqbcORmxBzCmF358U7o8t/u+XxprFqjgbkU?=
 =?us-ascii?Q?uIDXHprQY+Ul07iFBtwROyBKNs9Ct81jNF6HOGAU+6DAi9i7u4mThKuGlipY?=
 =?us-ascii?Q?uEH6nF+V+e47SA2YdPkHxQVZtNez4d2YuIqe179E5+CqpJhDcpd1LBL4UCz6?=
 =?us-ascii?Q?uV9fB8kJRqOXWAcPECL1ihm6foRX77dqHjUK/JuYmgrKomLAQgxKeMKvVfqF?=
 =?us-ascii?Q?7aAGLOfGm/MS3a6WuP4XfxeAMpqpfVO6H0ylUQJ5AcE3rIUJmJOitfqHA0A5?=
 =?us-ascii?Q?34RaDf6YVCYQmV82E+jMJidUjEKzfnj5x1yBSh4iEC5ME6bhssfvfNEqIbDa?=
 =?us-ascii?Q?0B2an7jDR0ajb6H5IWiFR+ifmh5sFmnWHCtf/seB8ID/QD55uJZgashpq/FC?=
 =?us-ascii?Q?VIVeUeXlQ9sTcztKxNwVekhKMsU2U9efg/RKfS0zAMCLva2QfTrRTNio0S0+?=
 =?us-ascii?Q?ZXbL9fld8V3h0/tocShGOyeH2QKmNPGjPK/UNitrY8NrMrPNX7ZpYyfEG0vn?=
 =?us-ascii?Q?mA/7YV4ENEhE9Y30T0F3ir3hHSelLmDVgVAq5Gkemb9FifrOW03LBeHVmchT?=
 =?us-ascii?Q?iSe03Q6mlTZlcOJsNh9RDJku6odZvRjQYExLujvSAVinYEK2xHU3aKZdsvAR?=
 =?us-ascii?Q?1J/IMdp4b6o07oleWSTojpG/buRlBgVfllbcjclo5Cx0Sg4MQw0Xt9ZvTTJv?=
 =?us-ascii?Q?WiVGWx06f1x7iC+MNIjHzdUNzvj0E/heEKKRYkT6Z3MTHW7pNEztAJXmoOrw?=
 =?us-ascii?Q?bicZtvdJeYbM3aNUq6o997DNzhH/O5om3DvMfFcO4DM2ROBS7xN/sq0iodEZ?=
 =?us-ascii?Q?ucF7qGKh3utctNAPQLx91aEUMmlqzrR/qLAUAzZw3cfC1qCxpEezlVwElPHI?=
 =?us-ascii?Q?j6WG5rBVhlsZ+Fz0ejxlipCMrD4QoMi4r0cIId/a02YAdNTTWUGb4OTp2Wn1?=
 =?us-ascii?Q?1I2i0eggeGqVBOzPPZlXJfr7hrIh+HpdBGRFAzGXJWNGhq71ncLj2vV2CDlX?=
 =?us-ascii?Q?zy2p3ExpD3MfhfoaCLOgOYg/zHuO34mIn2XD+m5OvMoUUMFNbVGgRW8aVxQI?=
 =?us-ascii?Q?4KnBugzYVj0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ciKluz3p8DCtjplxd1Esnf50cVz+nJ5jZE78iD4vu0VjX/BwWO71Yl8Vf2C?=
 =?us-ascii?Q?48vzfOGNKleh7/ej1kFspY0LJXZoY7bf5EpLdsv2HcVktup4wA5BG4ATWOaV?=
 =?us-ascii?Q?waB+VsI43/t1lkcbuzxEQ4VXyyMGYXigjGdbJ0/jK8CKSxthtLAtT4WH6tdq?=
 =?us-ascii?Q?5GkB/sLJsO3v6B8VIL6vS7p0w2fojaEgPBb8jgYNS1V9i5J3AoUSkXIV4gW6?=
 =?us-ascii?Q?nXepuqq6q1oZa+awx+G5r2qaUZ2nHMsdhf6H/BIbGt9Hd4BnuzUONZLJInPL?=
 =?us-ascii?Q?i4omxZ+TMHjxA83taGWwcOSA80fAtxRrJA2SOi4wgvGidfAXY/Os2PX/OQ0b?=
 =?us-ascii?Q?Ph9ZZgmImC7fAXF7MqTEw6guI5FZdJXgKIWN1XZ9ZA46wTStkGKUqossvkYS?=
 =?us-ascii?Q?qpVYIN+RIbkAMtbx1jo/pYxu9UmLdZ6KLw2C5fCbNLWdXGQPeTldiY+o3vSR?=
 =?us-ascii?Q?Q83hNYyS93IT6w49AmuhAL4bPgtcpUYk8IKJFlFl1VP4ZizUvwDqTMrAzhgr?=
 =?us-ascii?Q?NeXZoz070xD4R+UVz+vJ+wOPk7sr6Jo1FmWX8ubOE2QOAOKs/Mv8/OWDgd5l?=
 =?us-ascii?Q?RlrrlmNw6jfWYKNcT/trnjbdvRNO22Pkp+JpcXRoxT1b2XxfTeSFyXXGVxjn?=
 =?us-ascii?Q?JrXHNBJPKglmcQpSAIM7Uamx03DSM2EvuvYmAXbHio2V2EyeF39mk9Bou+fg?=
 =?us-ascii?Q?TDltidouZ/mXYALNTa2XUNnY0dHSxOUeNmsiReBln+BzCHWOd2d8fUtfWO5x?=
 =?us-ascii?Q?oW8zLMlVGhuCMdgtLNsEyMZ/JHbsU/GaUCY55RfNkJRQ+PVV95IADwq6H1lZ?=
 =?us-ascii?Q?8ZY3jicGaSuXsO9ZTM10ruRNMUpv6tVuRrVWsQqVyGC54Llz1q1nkGzT81rz?=
 =?us-ascii?Q?iasVsShg29zoZZYFnjtBCtAcmnH9+CcwC34JF0qhuJFUHCDURlduIVfmYDKL?=
 =?us-ascii?Q?ggiuvdbX2qlvKgUMdcZbjaZM6KdYgJ7scaFuNc2Q5yrCjcXAiTtfsQdxTqQF?=
 =?us-ascii?Q?E82CUdfclDeA+1ZCocuYLOg8NuvAM2UnfZK4RDp/0f01yyV5+bZisJyqhXbV?=
 =?us-ascii?Q?eOJiFRcztBVS8z2jFk6uvF1eY8qyEVA2XgGMFCL8+b12ZmC6/6nJFBksA6bP?=
 =?us-ascii?Q?qiYGWOpFJ3wjzUMX/I22+kXJz/+mCeS33bvAL7mGhsJQ1eT01DN+2+FbXLRD?=
 =?us-ascii?Q?BwCodF+hSUanD8Iqvu3fkzXDjlH0sxM1MOr1Ii4nGUFx7fXEUffdMril9FOD?=
 =?us-ascii?Q?FMadMQZszDQ2GZqD9qM3RjF9J5CNAZjz2sl20DMe1VGz0fIufyi6OJvBcdym?=
 =?us-ascii?Q?3QhE+ins1tWlCjFKB+9bI6WbFNNbyasCaCj46atbgx31EKvcJM0tKBezz4qT?=
 =?us-ascii?Q?5N2nJtx2XLjY70uMCDQYOzZrrTnx+YYbYAlQu+W7g2xLwmMNcORzteDsWxRn?=
 =?us-ascii?Q?yKpg0efSyxB+Eo4Ds9QHjQsqNsjQ8DN9R1IJ/4gJSAbH5A+uji9IN/gpJeLg?=
 =?us-ascii?Q?T0+UmOpBBdPk/BCSlShmvSQQHcaasB1DVfOR+8r6vSNsq1jbbWiyhuAuEleP?=
 =?us-ascii?Q?w+FzTKidqd7dj+mtwaDGlQZWrJXyYxPYDuMTfNntYM91krc1FKyXpM6tH65l?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3vs5QdPx3lR1261dFC1YSvOULVtQ7ATDyxGJYauoK9jXROfdQvqzDMibuxDCAFz3469Nr6JsO5dDOc3mfVyNKgltF2RgN7L4xEH9Icuq6Wv27AEk5dlw788FkuZMCwqS6oOJEXCLWtDG9HPnYhroKzVulRJvl7slhIGD+pneBAskOR5qoV0rKvJnImjjLhIG1/G393E+GCUyUWBsE2Eq4P5dbdCRSlixt3XcRculgd38PsLaEIANp7UheP+JSOZlc25yVXvZAprI39SY4Lj/MQwmHPuSTpqXHgftCd8F/OIkqP97adSpl+phU5JD1y8kQMd1IAWb7RCydMfhOXmYZKV/7bTYlI9TSZ4cDP1D8kkxzNm8q6lRicNYfETz9z1tNnGTooIXmC++Dv/MmVSffjMjB+3kX5kAxBTh09KeHmEuyiybo5a68Ck8eM/3LnKFdEtCYEIQZGBW0HdYb6JWXYpZUac5/knNYAQwNN+LQkACENLNPaNrf7qy+q46/rsfUI6PsauhBBYLshynUNO6FzCOXRCSAb57xMm/ZWmkBBcLgSEZeCY9eSDPXZR4Bh4QcAYF+kZObMLufvSdR4ntkC2wXlGNxvaeiQc65q/Kmiw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd38617a-d48a-499c-879d-08ddc8a7157c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 22:36:50.6757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Pg9pELowDr0F3K1QVbtmk66pih4/NDzVFEk6OjUwU/wh+4y+oHx0/DkZL6FSUHWakxKfYtv0cYokKBxv2I80Nv7X6QNqdsykUn3JbWHgFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8540
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDIwMSBTYWx0ZWRfX0+SyDp8BW8ds
 HKFVkOkiips6Pyvr0ymtaG9MZKZk1YXKhpr6pc0sL89YD4HVPucHf7LMfzcTkClmSK4ZWfGQAnH
 vjjWWu2jEQ0zdd0IvUQ0tJIgkRqr+ZF4SAtAJWlqp07w/JgoF5dGo+HJlPMhKFtiPMFq2N4LSy6
 h3g2kGI/CzNBJmobxXw5CzufHucrKpW4VnNOAajxOSTAHB1Uepg+JmiQpj4Uc/6mRDqusKrDSrc
 SenH3volr6/eKtVTMC9+37MQtMjPSFnCifxcGK3GKwQn5p8VDcD7iMiZGVJj2RACh6S7XhA5NvG
 t8SaNgFYav94pltmmKMr8pPKyC02J2hOlhKW1BUTBF73MNxqyy+HRSd/W4uLSE1XEYNfYuzotvn
 8sHMKDik8wk8aGwula2+mVt/r1WovVkrcCHvmc3PogRbHqPNKCYnXzPIFlOwwjzLiCQawrNN
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687ec107 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=-gUOwxeZhOkOfYA78eMA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12062
X-Proofpoint-GUID: rBmQS4BEVUVR9nKBtIDYVcoV5f6mwvAO
X-Proofpoint-ORIG-GUID: rBmQS4BEVUVR9nKBtIDYVcoV5f6mwvAO

On Wed, Jul 09, 2025 at 03:47:00PM +0100, Alan Maguire via DTrace-devel wrote:
> Now that the tcp provider is supported, update test.x.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/tcp/test.x | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/test/unittest/tcp/test.x b/test/unittest/tcp/test.x
> index e0ea2a5d..4de906a9 100755
> --- a/test/unittest/tcp/test.x
> +++ b/test/unittest/tcp/test.x
> @@ -1,16 +1,10 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2017, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> -check_provider tcp
> -if (( $? != 0 )); then
> -        echo "Could not load tcp provider"
> -        exit 1
> -fi
> -
>  if grep -qF ../ip/client.ip.pl $_test &&
>     ! perl -MIO::Socket::IP -e 'exit(0);' 2>/dev/null; then
>  	echo "No IO::Socket::IP"
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
