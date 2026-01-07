Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E372253FC
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 02:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754295; cv=fail; b=Dw1wLc2BnwHToNtmtyqiEoHwm/bgmUUcBbU/VOIAtnk6ruVhMUPdmOQ4tkcvbOCgkBqUEBV04HcB9Ej2HO/n2ilsrZWdGY9ThvOA+nnbuqm2GVW1UlsAc1qzpzckx5+ivf+u3YsxSJQ/n5L0JTXxBeVH7rTyGQ1jm1r/i8OxWW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754295; c=relaxed/simple;
	bh=RdR0TlcLqPQ9Q9r+q8AC0VKpjEBkyFrYC2kKOgtT58s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XFDkoavK0b1d6ndk66Ri68jQ9+f324X+1l8aPOzWMdrOht2WLwjEhFAF9zKbBS0mODiBMGwRrqTAl9hJhLUxNxld5KjffWEuD3BWve9a1AQGyUx2OdVrIA2nBs5QpLFLJq+Abq6NV3bojYt4Mij6Q5T87HbeXXWTzgzNqeF8FX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K7gIhbGn; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xO0doWfX reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K7gIhbGn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xO0doWfX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6072ibP6971944
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 02:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jUl8GESeorEbquDn5e5hk7S6nDEY3zOf/RWZdArfHtg=; b=
	K7gIhbGnaiTPHxCOcyOXuoXLuduILfObDb3K91UPiFTS2NxN9dtDXCwndJQZZS2u
	cIuQGKgPOAU1PI1m4nvVRju0q6u+cjcADo1t80hqNxUNOh9IfibmvTe9aihp4nse
	L5SnXXyCVf27bjFTpKWhBnn0enYm60kdladQ97y08ssWT/CtmbauAHMuLNRDAFFF
	KIvCBOVFJUr4UR068VR2Tq/P89Eqqq5yo0ScnnKQBTQSi/hbbiAgQi6aeP3fQqd4
	sWTvfbSqrqny5qx2hjL9XtjhFxnU7TUl/dSe0Kab5BcAB4lNCcxRIThPHc1jezyl
	B98UzhQUGI6sI8TpiPZ12g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bheyj8035-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 02:51:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6070HwIL020493
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 02:51:31 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010011.outbound.protection.outlook.com [40.93.198.11])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjkbf6q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 02:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyobuTyNjAt/0U9pkzr9Z6KoGOXv4GPxVnq8t+PMutDQX5T5E9vL1gbaD+NdOir44p/P3FDQd7SjRS65+LVopiO/Ag5u7unZJ1Iy1I8Edvk5tm/Y2NGuSsTNTQ5U/qsF1xI6PAldy2s50iS8LEc4SvLVYkpKq9LYDjmfDXRa5P8KvURHGqiTareBgftsLW2JFvF98tmNJmOLkwjP/ojDYjEkb3VwBRVU7M3zhbOIUNSJdul4HfLpLXk4BTMvNGDhJ2SYG/h6ongLmleyB9r/cBICEL9eHfBJu3r+VXAwSrpCtk/xRRKo4z8KROf1KVpQIdyXG4tcD09KDueGQ8Zigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiTgzeyCh8Q56QFi0ZNRDryjH7OtOajlLWx5p+lsovc=;
 b=QJP9kOgzuvzFZAqb8sxmocCw+6sS9BWfctZn/YnaT7scgWXUMI1HReYaOfv0on32j4G7hRApfnYeIfdf24d+aB/jnCwTSvb88GLiTVY5hVwtihAGs6I6kkkUxfgh4sSD1Ig80V8WYTjEfM2n4vWYrjvLs2bxuO1j3YWf7WsDollZmPxEV2vvwQKhv1Pxn+sBX75j5PUjvq07rF/2K2OzZN43C7MMQ4ygAXZb8pPUTg9nxbOdb1LYpQr6zASqE1/19pHBvop1myaL6SrlQNhcUfu7nyBr9vs+ONaLn8r2kMV9wf1klPPRr7/cr3ktXriwSHrEjOePtFejqCpxqeZ2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiTgzeyCh8Q56QFi0ZNRDryjH7OtOajlLWx5p+lsovc=;
 b=xO0doWfXoV4YUV4VWDH9QhCCgy9okRZA1PFArNBxcI84sEs2svX7DEs6BvV3A0+ofbr6bUmjC47MESB9yuogwerWrBeJK8bUFXCQAKMZElQ6XoxvVqwcVqVJG5m9fPp+LRKmfvFRCq+sCR4kTtCoKS9MuIKWDE0nlodEnTlFGt8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH0PR10MB4440.namprd10.prod.outlook.com (2603:10b6:510:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 02:51:28 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 02:51:28 +0000
Date: Tue, 6 Jan 2026 21:51:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 2/4] test: correct file permissions
Message-ID: <aV3KLg6oBmK5Yorz@oracle.com>
References: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
 <aVyjs1kIbPaulblX@oracle.com>
 <c2a055f2-ab8d-7d8a-5038-354708cdb19a@oracle.com>
 <aV3DcDB9SGJ0acqD@oracle.com>
 <718c7c8e-cdee-ca08-ba39-8772d1aeb164@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <718c7c8e-cdee-ca08-ba39-8772d1aeb164@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH0PR10MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: 99505f25-d21c-4881-9fe2-08de4d97a7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?VOpsm9PzfDuZZ/JYUBagptl+Xj8qR1L9ETyZN0cyz74LOsMiUmUzwbR8fX?=
 =?iso-8859-1?Q?j3/rdH4nGDSloe/7oro3d/chv2GXXKPGLBUWbdu010ED6LSoHGoki98yUN?=
 =?iso-8859-1?Q?0clurbCC+msR2BWu2lh3cj2i2lTuJrxJDc+ZIQ+gF2QL3CphBw1zidIEim?=
 =?iso-8859-1?Q?9W2sgF0im6PBWA+B5tfq0H+oomBL6PiCaZxVZ4DxkJEbGbFk1o6bLzBYeU?=
 =?iso-8859-1?Q?ukcH96bWxzY2/3vRXYlYrlCSfhzL9K90DNdOj2LBUGSuiHxLKcniYVtbpy?=
 =?iso-8859-1?Q?GvIRV0TavWxnlY1sLhqrA+ZAKJhB0ZFx93POJ9wn5IEak8vvBVL3FM5Tvd?=
 =?iso-8859-1?Q?Jb46g5GpHnDrSeQNxKjwb4L4WCFEY/A0CGTQZk42qo5guQ89I5Rpd2jx3z?=
 =?iso-8859-1?Q?yKJKcgvV7g2qt0s+hhzQLkVGU51EGybxJo7s8MV44kzgFZjJTL3ZJRuZ23?=
 =?iso-8859-1?Q?hedhDOKll4OK3W9p3hCmZuLNpWHmyb/BzsWu2vm9hcwcTjZW+UBtqZSmCt?=
 =?iso-8859-1?Q?9Joe0yQ7maR6dORLNOcBh66/HL5tDHV+E/i2THb6xU/70benlEG+nHeaId?=
 =?iso-8859-1?Q?py41eCV/yGd9SXciBGAE9Toj8jFQ4liV5P1qaY/92wjutzdWlTeS7oR8Wy?=
 =?iso-8859-1?Q?5bBa7WzoI3yos54I/MWJRPZid/j4H/XEQ9oO8D1gfZ+8lesqhflV9PUbOI?=
 =?iso-8859-1?Q?tkW4Ma7MXBwaeXVx+8dp/etNheiCVNol2kUIvwmj3pUnb0BtwC9onL/O+Q?=
 =?iso-8859-1?Q?37NelMmNvn6Dc5O7ZSIupkVL0xSEldxGseKKgKnHhrBC06E8+HJqUpb4oW?=
 =?iso-8859-1?Q?3nbcthGBowVZZZtmpfhowZZj3FoXR1n8q3JTmr1hchJLdAWEIRnR6QtvVT?=
 =?iso-8859-1?Q?fbYboi79ow2Y9AENAxrmizdN3cv8xWByoOlJ4jgN7VY19tFY5vGbwDHHUH?=
 =?iso-8859-1?Q?7DymcAjxoDV6BK2lg06FjRkkPw9UQtsjECP9lWZrd/xWjvszjtLdh3EMij?=
 =?iso-8859-1?Q?F+6aQ+ZaIb0c7Pg/G7WMEYiAnPVQ1N2zeLi+WwaAysu7isHpeUSq1Z6Gmj?=
 =?iso-8859-1?Q?dvZj7IzgAph6wG9PLlBa3Je25iIVUJ69RpQ5FFegjwFF710g9zIgSXGTOB?=
 =?iso-8859-1?Q?+HTbkbgu61QxeCyDQ0sAHtpXCa3xsmLiHU3ReQdYe7rq3M7PO/GgUKqnjY?=
 =?iso-8859-1?Q?/cmLzCv0pyMareDQmnBWYWBHMHoRzgRcWzuxgjsS63jHAFjED8Y1NLtnuD?=
 =?iso-8859-1?Q?EhTe0Vdp//vxEQlNjDo2gRiI4EiiyfqttSU0cVcYN+zRYaVTXSYYulYWzs?=
 =?iso-8859-1?Q?7d+4EkWB7JrIE7yviIR/xBFY3+GF1m2j56+vz5xvWi74J5l79yeM7EfzR5?=
 =?iso-8859-1?Q?2aOBdsThRqzbjleFdC9cG+aHvTFlWUE7TRTGAd/cuETTXT2IVLicE5AcDC?=
 =?iso-8859-1?Q?Mf0mCd4BNJlWT4BuLv3A6KV7xWFRXLRi/Tn3PmagvhN3IcUPyC6UxKkTth?=
 =?iso-8859-1?Q?Wm+r69G/HgyOlKi/VMbPRr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/WuaGIxeT22PHS21VYndlBKSBMmJnqBDmsyOLIYEsA8T4l/4ojIyZubUHT?=
 =?iso-8859-1?Q?MJT/gEYb+mobBZyE94NztDc/KUY5DCF230zN0+Ko0OO71RERa/QRE4tM/h?=
 =?iso-8859-1?Q?TYG9a05GnDOZ47a4xg/14lGK3zl6UVCKfwG5E3ZmoPjf55pIBEc6lmyEgI?=
 =?iso-8859-1?Q?bLGY0zvFByV6k8fvS3ZUrx6yhxbKDS5xDWmSFTov+vtFBrW9SDxY16VXML?=
 =?iso-8859-1?Q?73cv5DdIUiDD+2tQOVtvtkbyr3LQIvFiWWPuFHTANYzAkoRnvRvWIpZV+w?=
 =?iso-8859-1?Q?fyi5Vf+Y8uvQLQr1F+nPijpeZuJBvz3MAAlpJ76dpoeICC8cn5wOXZ5voD?=
 =?iso-8859-1?Q?Djq7LPxeEegyKjlpF+Zjn/FEl+fbN7j1shp1PaiLFiNU1rot9fKYt0vxXe?=
 =?iso-8859-1?Q?mV8x11726ONZvbDM3qGeLpvhaoKIwJdfAKxwCe+smOcNx39C/m+nvlt7Tt?=
 =?iso-8859-1?Q?7n1iLAnqTzavev9lBrLHISzLA837V77VKBhmo+EdhG9UXzLBoUdkaRlrI8?=
 =?iso-8859-1?Q?gFzRTPO2Iq4UF0pNYj9ZBCposgvuY+CFoLMAGoehNeBdL+ofjg3gJ6wopn?=
 =?iso-8859-1?Q?AJHYPxFvjf24FV0a6W5S/7RYHd4pGXu+uwyJ5rPaBL1xIU1jclhYessOuJ?=
 =?iso-8859-1?Q?PWm6uTXw0u+6LeT1/K1AjInAj/WQRke7dG2hfjmDZWTQUZwL46nCAema/0?=
 =?iso-8859-1?Q?a2eEj1kpk2VoJWRoV/X8GdHT3wq5ztUNNUEsxzESRWK9QGB00wP95/vQ0D?=
 =?iso-8859-1?Q?Z1+02kogKeNypZyoCRFO4TkQfPfmnuCQbiz8qx3AYlut46SANnCWQdg5Jx?=
 =?iso-8859-1?Q?/u3uzJdDBXm2+wYKIuILPl/JS76tko8gqkjDvRo3zrEcvHxH/kEH9k1N/u?=
 =?iso-8859-1?Q?z/Jumfioj72Ps+wOh8lDFzDZeBjsRtTy8uaKqvbVmjazkXwYI7fk/nczmC?=
 =?iso-8859-1?Q?gNA1OhCsPSHAazraBtzOvipBerzXw0ETIookNhWXFICVn1QxUuSyPdJA72?=
 =?iso-8859-1?Q?Kq+njzwbSt/DBDupTdQBuZgtjIyP/1D5xfiQmFB/Qd9Lx2VP8zyZTK4Oce?=
 =?iso-8859-1?Q?pNbQBP8+/bHEN5JHGRKgC/cJ3oaa+PId+7uCXiFqSEtQEng0LriKd280qe?=
 =?iso-8859-1?Q?Utd/Lym47RGHBP6o9YsxjFMJ9Sa3xyrKeAZm4YioisCI1EQK3NwILiewFH?=
 =?iso-8859-1?Q?tfILqLYYDD7AW5uqAoBbQ3PvT3oWdYf3VrJVS1OX5Aoy0B8s0hGArhkqn2?=
 =?iso-8859-1?Q?IVTn58sqoiL1vnxf2ts+MxjkCgLl4i2LynGNHU4UmkoNn9nL0cWk5KgEHx?=
 =?iso-8859-1?Q?ReovFTF4QPDnKbAG3I3umESn6w2AH0aCqIrlhsgimvsKSOKlgEQ5CUZlge?=
 =?iso-8859-1?Q?wFKAYGGTSFFS1ZYsPLZHkLL++YFbs9EdZAqYLJH1EFpf2SVOBclFtHFg59?=
 =?iso-8859-1?Q?5WmzE1wQ26GB3nr+iBNH7g1AQ2Xg2Y1D0asD3oXrkif+s11WrJ9arKWhEA?=
 =?iso-8859-1?Q?E6AodwXSNZ3YFOhd5IeW0JPi3+AGfG7eUjoEPwPgqiTIAOsGjKeq8hoon5?=
 =?iso-8859-1?Q?rJmkdDc+Q2/UX+YUsIMkKDw16/oZ4OBgA98e1NI1E+IwUrSy7wuYil9+rt?=
 =?iso-8859-1?Q?mOs9zBXH5/zFLvBV7XZ2Wio/HjWUPWABr2+0zZz32HSu6DfCGYSw+iFcAZ?=
 =?iso-8859-1?Q?loBOl5zW81SB2Am6NrXfNEPUPfIlhQoaa9zSKO0f9BxEQQ4dOsPNONpQeE?=
 =?iso-8859-1?Q?grk5oANwnxii2f9656l2CS2CXRcnWp0VuYbYxi9Jcf8AqcaHNsQFj64ifn?=
 =?iso-8859-1?Q?sDSRwFPl5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3j1cFpEUE4Qct4mpm54rxO1FDFz6U3AEjpHR0kIJDR7BIheQeks9qBr89WGg62Uy6j1vXk6TzxVR8UuUPMdy5YmfCuXNllQ58cfW0MRn8vLc3vQgiV9Ys/IDtRKOH/w0TEM9XScXzwi/sJTMC+V0g7T/6/bx+EJ8gRBxpIh2cE3It2JksZhoaKFl0aUUI4jIhWBV7TELXlYfyobVerVXEAYuj2j30cwqEKiTdA/I6JMU0FcZhw75+MiELYu6RJscv5ZDIdFCDN4ReKd+b/5Qvj7YL57Sk5jTMLnQleJPo4v1Z8hTALhLqNwjamrUMFaQVhxpt8yzTLwvPUt78pGFQ0T87Fj/jlAHpHjG1Tn2x8ARqAC18wKjtEpNvThpwK4g2pyO+IgOMSK4bW30fycKdbTedt7d1A/teP0ksqF7a5doZjI7WIeVPIWhOQizJE802G0n9j8AbiDUzqxwVlYGoy3dxNlQd6c8XBjB9qIl0+tqxsGS/QxkLTmpt2ZMo/WYiHiMsUdLnAHPeLmKP8iLrlWMaYnWr01qH2V0FNWx3CTGToAsO5vHsTqKFUvaIeszNJUhTdp2N3JTWjmX/EK3+JHSabUTixxFUZ9Cp3UNsXw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99505f25-d21c-4881-9fe2-08de4d97a7c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:51:28.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44otEEa/q+e3Eat50VJvhi2PHlZ2dnq9LBAuMyWpM/f0Buld0NLCrxEcfTn7xa5yicZPpM87CpHh9F4dMm9UlePFAcE9324vP9H6Z9O+Wgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601070022
X-Proofpoint-ORIG-GUID: Mkt2E4ztYq4IcxNXHbutXpZudjUUWOIW
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=695dca34 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=O9GOMRE4fB8juoMYVUYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:12109
X-Proofpoint-GUID: Mkt2E4ztYq4IcxNXHbutXpZudjUUWOIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyMiBTYWx0ZWRfXzXJy8WBYNpGJ
 ku2nqglUGTn89EWWJj66IUxXRvJknZvXoqDZKxqM9ISIRnNFG1iA9DcZYRJxN9hhHCzMN/hVm7+
 H92528qsUIV1YYa1t/rPqodUS8UOardhFAdvsbVnb9VJ3X24oEw8RLflanvqw8sK3mvnMQ75HfT
 JisEd9Wm+u+pAJo+4QYCs693qJhx97VlYQhdYiwtCb1avoa9nZ+K4nXPtukPx90LrrX8iXMgfrI
 M6nSg+/bgoUUDQBG4stXKmPCnfiuqQ+8l+MgzUR/X0OZcBeU/x5tU5h/jw8OgC6IFOLb98kZxwR
 9GnZl/FmgETR8edTAbB+XWY2s+4SrhNgcKrCDRr8nAeJ9Dh7+7ngfLaWq8d1awEAyiaPWAsAaLz
 ZZ2X37FvQYq2ETH/VG2XeqcutMwlpQalcOgZ2zAPPkHe/Jx7tJaJeQ19X8dk8R5PAkc35G570CC
 vC04QVeIXkMgOuUcz2zQk2iUAI5VOtFVnLw1ufmA=

On Tue, Jan 06, 2026 at 09:45:36PM -0500, Eugene Loh wrote:
> 
> On 1/6/26 21:22, Kris Van Hees wrote:
> > On Tue, Jan 06, 2026 at 08:20:10PM -0500, Eugene Loh wrote:
> > > On 1/6/26 00:54, Kris Van Hees wrote:
> > > 
> > > > On Mon, Jan 05, 2026 at 11:50:53PM -0500, Eugene Loh wrote:
> > > > > The patch otherwise reads right to me.  The tests, however, are not happy.
> > > > > The following tests fail intermittently:
> > > > > 
> > > > >       test/demo/script/interp.d
> > > > >       test/demo/script/tracewrite.d
> > > > >       test/unittest/lockstat/tst.lockstat-summary.d
> > > > >       test/unittest/scripting/tst.arg0.d
> > > > >       test/unittest/scripting/tst.basic.d
> > > > >       test/unittest/scripting/tst.trace.d
> > > > > 
> > > > > These tests fail consistently:
> > > > >       test/unittest/scripting/tst.assign.d
> > > > >       test/unittest/scripting/tst.pgid.d
> > > > >       test/unittest/scripting/tst.pid.d
> > > > > The problem for these tests is
> > > > >       -#!/usr/sbin/dtrace -qs
> > > > >       +#!dtrace -qs
> > > > > Since these files used to be invoked as scripts, the -q was ignored.  The .r
> > > > > files relied on that.  So the interpreter files should drop the -q.  That
> > > > > does not fix them entirely;  it simply makes their failures intermittent.
> > > > Yes, I caught (I think) all of the opposite cases where I added a pragma to
> > > > ensure that the -q behaviour was retained, but I don't think I considered the
> > > > case where the script was not invoked using the #! and that therefore the -q
> > > > was not actually effective.
> > > > 
> > > > > I'll look more at the intermittent failures, but there may be more than one
> > > > > thing going on there.  (lockstat-summary looks different)
> > > > Thanks.
> > > The intermittent failures were weird, but that lockstat-summary.d should
> > > also fail is just plain insane.  The problem actually appears to be with a
> > > different patch.  So, I'm withdrawing the "intermittent failure" complaint
> > > about this patch, which should be ready for a final version.  Elsewhere,
> > > I'll report on what's really going on.
> > Yes, I believe it is due to:
> > 	[3/4] bpf: allocate the buffers BPF map to fit highest CPU id
> > 
> > I must have introduced a bug in that patch.
> 
> Right.  And I reviewed it.  We replace num_online_cpus with max_cpuid.  That
> should be max_cpuid+1.  Is it too late to rework that patch?  If so, I can
> supply a patch to amend it.  (Anyhow, events on the highest cpuid are
> missed.)

It is not too late - it has not been merged yet.
