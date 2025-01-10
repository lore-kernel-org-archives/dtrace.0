Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A321146B
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520457; cv=fail; b=J7RTp7OgEKOieorVQwX+GN42CGwX99qzsjKooWKWPRl4Jcfs+2Wie5ZUDlKqgqpHsPTWFLOKSeIGALbr0eA+bnmddvDW7/AHjbDBSXB9vlsa2tRzWPRbTWMvP/3fQDG88E9GkdE/knS+DJPzfy/jrVi5UUzXHVZtl1m7ulMFdVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520457; c=relaxed/simple;
	bh=KyIHwAmq076dmx/x3k5oP5Sv2/NWAj2UIMeJTc4n3G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Su5CPhZWzvjEwVCfboB183EU7zg5YjaHc/tgeVTetaN0yxuB5t5Ny32n/XWxH2KYUjH0GSqkY2l/yQhgk2TmwoeJKlTH64e75p9ER7sp4WoTAU1nfoNeHfjhlilAngfJdA2cflMFQWTtg2J/WWt3gsyY3whzYCA6aHyDw5XCCLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hpPykUCD; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OrIaEShH reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hpPykUCD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OrIaEShH"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AENobZ029967
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 14:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=tQ2zKVkRHZzF0pDMTXMrpbPuMQpuxTxKgFtfSDj4MLg=; b=
	hpPykUCDtS2koJ29IX8qqQ0UiUkUzCUJV2BayxIRSricMRfHsXhTHVhnnXW7Gd+9
	Ie4qrM7gUXdHgFXE82mdUhVCPf7lyzirdO1mHdms7TG6EY9qCV1ucuLwnoIewn4F
	j+vAnRheSjoSgsdXr+TdNLXbPQBTGJlRJpz0WlNuyID0AVPqYU1XBBPN80GsgGmJ
	peXz5CcdKtkcxQ8nBPhWoTF1uPxDnVhAI5xnmciUsZRh/HV8eKaJ6YdbsuCO07Ro
	y1Dk92Op85E+bS8ZP+DjhfhcpxC+a35SY3bgoFEzah67MhlH1D7ZRtbCXLN84rrY
	m+gNRUECuROYA5igBi9xkg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xuk0bdpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 14:47:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AEiwn6020119
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 14:47:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuejwaa1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 14:47:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epdNxCG76Odw3L08TUb+VRoTmvaGf7UYWR2Ky/mdXuTryS2avv1mjWtddWgoVL9c+aFWefSCWu7f0TFH9SDiW89VffZVJCAysZVWGpO1HqDsV9wSKicmgkoPW9/d+zaiw9tXUr7OM4u5nkj0fI+mtq/xyCfJb5Cts9v4SkLj5PI/MfnYYkOnQFsBtHziO7cUkWEiBIOMZwxriqjb01cAZTJq4h/ta7evS6mAVc5QrNuXUQi1qIVe57B3cU7UelK/qYFI8m2XtMUrgw43xdnst//nx1aWhOtYJ0fl/vup8irlZVvsgYXbq5t9F365wQqWM1JrXIVWQgR/enmHBimUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVOf0LtWvsGsa2n72BOzwX8ETZ3d54aR0+M+9hWP924=;
 b=oWC4r0Is/0axR7n65s3phjh85O44DowysW3ml2ZWJ8UUqs/2e1LwJrXyNdF01wmB7aFPiBwabyaHVAYOMBvvZcX53D4k5nl/8eeLoaXXCo02beA7nXp2noOMPXBUuInB3HBrxLMg9amNqjuE6I9H8nIZPdywn0jOoIDbizx3w8zcsIEE4aUFIM+ejRISYaftOQ4fJ8pS2I1eK87hZxLoQhpcUxb6GmI8GEYwgFXT5A4yf1UV+OnHl5dLod9ZMhTfPzw0LqvOCYXS/Po1y+t+DHqhISDnTrdguZ2OJej4mqonanqSYxbr9pikV3yJyYCm0jXYuKiQfKpkKCkOBZKFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVOf0LtWvsGsa2n72BOzwX8ETZ3d54aR0+M+9hWP924=;
 b=OrIaEShHevzzEZKjN1IH5sbBGEnvja4GipqAEt1b7qZ2k5Ps3d2GKk/SYSmx0lj+PkjROP2W6Yy4o/cWDdcESEDKDKJ6aofFRleXyWdhkkS1PYNHr3O64UP7X4aIwkd1WzwbvoKlwrQ+dLx+qNPbuVz4x8XIIPtu5yH5F04Def0=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB6715.namprd10.prod.outlook.com (2603:10b6:610:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 14:47:30 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 14:47:30 +0000
Date: Fri, 10 Jan 2025 09:47:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 6/6] Add support for pid function "-" with
 absolute offset
Message-ID: <Z4Ey_njfNYazVbPg@kvh-deb-bpf.us.oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-6-eugene.loh@oracle.com>
 <Z4Afgp96zlq1g5Jf@oracle.com>
 <68af528d-8dbd-f081-835a-d92b42e3045e@oracle.com>
 <17bc480b-3785-7b7e-9df9-601d65038df8@oracle.com>
 <Z4CrGJ8Muw1qXDf1@oracle.com>
 <70efe39d-ec79-a959-f6fc-455fab4f0d51@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70efe39d-ec79-a959-f6fc-455fab4f0d51@oracle.com>
X-ClientProxiedBy: MN2PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:208:e8::32) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f56288-5a6f-4495-b194-08dd3185b582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?erjm8bOxUsBBbGFalxEIZPpY3UCv5+yvXoe0gvmyW3y7HWArV2WwKDqqKq?=
 =?iso-8859-1?Q?NdhzMB0VgV7O8RmtB9mHYOGSFdGhpolagvu9CW8e86BFIVg0YhReei0lVP?=
 =?iso-8859-1?Q?FmRAdfwFLdt7QM2YitfMML81/Mhr5t4t62d5hxWdM8+dx5N9j/2ZsZ7m24?=
 =?iso-8859-1?Q?D3nmKOxNmSQq0CUwTtJW7UMNMxOshCPBuLLA/pFreWb6YMN+BI2Pv9Ph/R?=
 =?iso-8859-1?Q?LzmZSVZLJc/PjH9RJ4iuPiooygd5ZqD7Q0eo2j9gXir/kJdxLwxf90nS4g?=
 =?iso-8859-1?Q?+5GW40yfo8s97uSVJlZR+rAkX1jRWejeL19jNgJWML2eSpK3pNeMnWPR7t?=
 =?iso-8859-1?Q?zmlRUzZTOH2lUoX0lmRglvtV/Qia61Z15bkdXf2rjtMKuYOoXVO9ilAfZ5?=
 =?iso-8859-1?Q?MjU1kcHsTf1GD3ipCNm6lmV8oK/PUu9I7UYTmt4FiBHZuOQVd2hyPV+qZ5?=
 =?iso-8859-1?Q?vd6iqyxSx3mfLm9AfEVsnCaMVTdU8j7LZEmOVsmcxbsckU9Mh5aD1UE5Tg?=
 =?iso-8859-1?Q?w/0s+IKAQ1R9zro25qribEr1N7TXmYv01VGvAGNQG8j14SqaZV6AdQ/UrO?=
 =?iso-8859-1?Q?+V1qriwViXoA5d5qdYuCN3VcKjUywq8RJO3RltgqR/DDarlkEP61meBKGx?=
 =?iso-8859-1?Q?DBw601Dp/suD3UtErPZ75UledAkFNudkGnlOq99dzmveLr1U/zGisJcBpN?=
 =?iso-8859-1?Q?JKP9xKZrYT8jd1by34mJCLhroSOv8cuecyeRmRWskZ2Uj2uEAtCAy+7Sfr?=
 =?iso-8859-1?Q?zAt5gCZaDEelu4v0A9cssKrqWnuop48dJcqrb5C+5y6WYY/Knq3Km4pLqw?=
 =?iso-8859-1?Q?heKDSiNff7ASEvgGxETICjuhQWodWu1qVqJqtEpcC5JseRcSDM4v987dmz?=
 =?iso-8859-1?Q?qsj2PdoeRiEhv/Kv7N+9pF710+3WG3XfsVDLebLOouQwnXuwZk8urTHHjs?=
 =?iso-8859-1?Q?Arc7G/O4YAxEOvm08giBVypJ8ImIrRFPNUl4GBoytJo2c7OxrTW2FA0kNu?=
 =?iso-8859-1?Q?VgdnB9be4L6xSDSR7ZesKUQhDPGF4u0B4h29MHyBKY48NlXowNT47rIIyH?=
 =?iso-8859-1?Q?yprPjDuxy7XGmqyqx7OJ18j/SZAWQZwI1fEXPHEeav0IvoAr0cQyGNLlkX?=
 =?iso-8859-1?Q?RUlyr10+mezM0oxag7Fm9YoMBmp/wDI1VL/maNl4pChY41NVuQzD9G30Jw?=
 =?iso-8859-1?Q?o08bgDHa9Wakq0Wx/sJHf8EFakjQvN6h5lftl9rR8oL8/0O6lOq23kFb1o?=
 =?iso-8859-1?Q?9shkKtJLFSIB1LDx1tdtcaDDqFjEgmh+yimbFDx3ESVzurWJfVF6EZWv6N?=
 =?iso-8859-1?Q?s1uOF2kFAZdg/6Avs30tZatp6RkHx/xCarp61kiR5WtScQXNyU8MBffHC8?=
 =?iso-8859-1?Q?JbqIR+OLZfDT2uMwETvz5HbChJqScTu/f4uBCTO+Y4d244Rkf4TjWCMy0q?=
 =?iso-8859-1?Q?mgdJ/vTzx+ASh2CU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7y9Ua0sNvzMf2EURCyblh6pPshOb3mipt38/rxptkEY5h9xyT3jStmdOlb?=
 =?iso-8859-1?Q?M5nWQDpI+JzTQfx1BFo4pmv69mbAIb3vXBg+wp8xOWPA+KcK+1AzLhU46j?=
 =?iso-8859-1?Q?NlSb2LgWU8ck4LcfSwWvdUsOxkJHUWlo83rQ+hf7u98Uo+ip8e8FygvINJ?=
 =?iso-8859-1?Q?O+Cf6M4bRmJPxCigEMQusnAHO+WKsT7DrkHNNMNTPByW5UdvItngnbJFnA?=
 =?iso-8859-1?Q?BiaA3t87c8gxSW19YNGH8vHYJhIjVtV6MvMLdwsb6QF6wzXnSDw5OHq/9Y?=
 =?iso-8859-1?Q?0EYWON32Rot+zD268fcKnZbkVVbQIxCM5gRAQJvOqdotZB9OhVpexJoZeY?=
 =?iso-8859-1?Q?P0B3Kkq1IhZ2mc9wHEjnZFpHLD4gDD1UVlXayIbMsqt5bNA3NAnyhWl16S?=
 =?iso-8859-1?Q?ptPa1fCLdB5bV5wrGRlvRCzDkEQkdHOTEHPJL52Czs+WjjoDiU51GtUg7l?=
 =?iso-8859-1?Q?u5G3hrI5Oqw5sDBRq3AVPoqCkRfAmGhNXcU9cwlVq8JdwzuHOK79oQt9yp?=
 =?iso-8859-1?Q?KVehQVtt/dx4xXoqj+HsRiBRs6T5yfAl6r/+TxO7ISKZFPkjhLGHaJLIFX?=
 =?iso-8859-1?Q?X3BtmcB2ZD9Y5xd2L9crLm2cqDkku0SNg1ObU5s1eoTLMykd6fctg2MPHn?=
 =?iso-8859-1?Q?vq/eJw6VwNAEYnVHelF0v47vO9qHaY+5hu17Rrb5E1AFBtDD3HhbnpyuBL?=
 =?iso-8859-1?Q?e0+uETt0zdFndcwu7XyC5rfgr+on2+SuOUF6HXeUNIM2nZKWalAgL94Cvn?=
 =?iso-8859-1?Q?Cj872DZK3P5WrdO3F2TkKBJdjbcNGE6iY46t3OSaOR0T6DZC4WIjg5ZVcZ?=
 =?iso-8859-1?Q?Ar1Mc3iCs4QQE2AjF3sfMoOwOAQ8R4FJ4c+xB4n/m8c9pS/fChaeHrKecc?=
 =?iso-8859-1?Q?vXIOuKtnbRJBTTiCJGvWAjydGjM9qIn8nD/dD1L948T+iNEvvFApjZXsw3?=
 =?iso-8859-1?Q?qNe7+5Q3SjuC/VgJgA/4VvAMnX4VRYuwI/WHwH5d/InszQ6pLkHGOlLq+x?=
 =?iso-8859-1?Q?SuAPiAqVKl1vykUvEbTELfcnqA5sCf2FQGT0xOPFI3EqGWynvnNo+cO8OW?=
 =?iso-8859-1?Q?l4aaCQLayEAL86FNzaCcaUDHxz1K44W0CV5Z60SfkwB4d4b7lkAviKCEnR?=
 =?iso-8859-1?Q?OcxoNAX3KKKNV/DNRYnyTrSCB76E+9Go6Abm7kdfS2otUDPDiHRNSa+roU?=
 =?iso-8859-1?Q?1fvo/39ht3kWD/UmrRWFJBbJgdpo+st8QzUktjsIVilp4l5N28r3QdjzE7?=
 =?iso-8859-1?Q?HsiAds6EHc/LMa6ORbDvXfsDK62zcGBFeX9nqRPRezvLAGiE6ps6zufQBQ?=
 =?iso-8859-1?Q?Zxa/E6vDBGLoPYZ6Yf7pKkA94l+F3n3YCti3pfsULInny03wwHE+1HrqTO?=
 =?iso-8859-1?Q?lEpNhB/1SIz2WgXABo1hGfkFybMUmtmx2CiG+RbvjO56hYwISj20JrgiSO?=
 =?iso-8859-1?Q?VCFrcWSAQ8I6ULIldwKK71aX+VpKyY4uEbcrXLzn2dMhZLmg8KDtiYivhO?=
 =?iso-8859-1?Q?ev5bjIhuCHPt2Une6W79sUylIYvUxq1RTqm6e0zWgwIrDqddQE+JHPagZK?=
 =?iso-8859-1?Q?xi9FU5Pyeh8xQJUCDD83Rjlh6ywYQryghFPb0ZHTkYohhEQAmGg2hVg9X4?=
 =?iso-8859-1?Q?hyASwm/76NlASkfwa3yVefa2+gvgLMVs9Zdr7iiz6A9UYJbg2Q3GRuqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iu/dmWJWfn4eB+VXS6l5zVmDVrpYJT2zNG09bfF4lPHjwwau/vp7twCgZguAPGqS4DUrvot69PXuOD79QMYjP+rkfSue97Q9zzJ3NfniGFlcPoM2JVlwrMTFLI2g7U9SMC8Zt0t4ElYZpMp1KY+TO365gUIA9NaOXsXjGPyuZG6HkS3OTrJyZPSFwF/HcrUbWKNFsdEDxuy1q76V8JQtnhvqlAKwfrKi7wdvxYXRnRLB1Uy66uFRL8ri6if9SM1jfLrICY5+QruZuKoyEYQ0WbC2vGFrVZW8QBmJtOMl/c/VBo7rbCoJ01gmBZMNTy2oCceeJG2q8gxU+dVBZ4A7g8j8V3ilerw/IvpciHPESknU0kxex1axJP5R9CpI9y9uEW30thLLRATWIjZ2OMxTqNPCGVrOZ+IwcXDCgH01d1JR4vaQ36zRgBIuC/u97vgyqb9gEa+/XRevDIE7q2wedoGwGwVp4C+IZh+4cqituADZiyLNUSwsfN3Z8Tfrs1vpsC7FQ3AMjCMe2m1h9nLkQFbvN2Cif4EUBL5VzgRUxIXabu36vseDBpCCH9ocWAMOZdC8Zmyiqu35gLGUtdGdVeZjFCf2JJIsuHy464R7nnQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f56288-5a6f-4495-b194-08dd3185b582
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 14:47:30.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmS2pWp7nWlgwRDhoh1kDPX0ZRnlK7ktSKnA/sy9CCx7tx/F3Jh2itZmczJ20UImRs4+LRSXEPWIEIqvvyX4ZmyQRSrEYtPseiSwrnwgpyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100116
X-Proofpoint-ORIG-GUID: 6JynwPceJRdMivYKhfvvtcMm-_3bO4rD
X-Proofpoint-GUID: 6JynwPceJRdMivYKhfvvtcMm-_3bO4rD

On Fri, Jan 10, 2025 at 01:30:50AM -0500, Eugene Loh wrote:
> On 1/10/25 00:07, Kris Van Hees wrote:
> 
> > On Thu, Jan 09, 2025 at 04:00:42PM -0500, Eugene Loh wrote:
> > > On 1/9/25 15:52, Eugene Loh wrote:
> > > > On 1/9/25 14:12, Kris Van Hees wrote:
> > > > > On Fri, Dec 20, 2024 at 05:27:16PM -0500, eugene.loh--- via DTrace-devel wrote:
> > > > > > diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> > > > > > @@ -47,6 +47,7 @@ typedef struct pid_probespec {
> > > > > >        /*
> > > > > >         * Fields below this point do not apply to underlying probes.
> > > > > >         */
> > > > > > +    int pps_absoff;                /* use "-" for overlying probe function */
> > > > > Why use this?  All you do with it is record that func is "-", and then later
> > > > > in the pid provider, you actually use that to force the function name in the
> > > > > probe description to be "-".  But that function name in the probe desc is (in
> > > > > the pid provider) already coming from pps_fun, and the code was already
> > > > > assigning func to pps_fun, so it would be "-" anyway.  So the pps_absoff seems
> > > > > to serve no purpose, and you could just rely on pps_fun being "-" when needed.
> > > > Yeah, good point.  Let me see if I can remember/understand/explain
> > > > what's going on here.
> > > > 
> > > > In essence, the problem is we have to pass two function names: "-" (for
> > > > the overlying probe) and the actual function name (for the underlying
> > > > probe);  up until now, they were both the same.  I tossed around
> > > > different ideas for this.  E.g., pass two function names in. Or, get the
> > > > actual function name inside dt_prov_uprobe. It seemed to make most sense
> > > > (given the alternatives) to pass in the actual function name and add
> > > > this flag to say when the overlying probe's function name should be
> > > > "-".  Does that make sense?
> > > > 
> > > > Note that pps_fun is not "-".  Although we set it to func ("-"), the
> > > > code that processes this case then fills pps_fun in with the actual
> > > > function name.  Again, one option is not to do this until
> > > > dt_prov_uprobe.c, but that introduces some other hassles.
> > Ok, I see what you mean...  because we rely on underlying probes, we need to
> > track the function name that the absolute offset falls in in order to be able
> > to determine the underlying uprobe that the PID probe maps onto (especially
> > since there might be another probe on it already).
> > 
> > However, as far as I can see there is not really any need to have a function
> > name on the underlying probe.  After all, it is actually a uprobe that is
> > identified by dev/inode/offset where offset is an offset into the mapping at
> > dev/inode, i.e. not relative to any particular function at all.  So, not
> > having the function name associated with the underlying probe would make more
> > sense than what we are doing now.
> > 
> > And if we drop the function name from the underlying probe, we suddenly no
> > longer need to carry it across for absolute offset probe, and this entire
> > two-function name thing goes away.
> 
> Right.  I considered that, but decided against it.  I think the reason was
> that, although we don't really need a function name for naming the
> underlying uprobe (as you point out), it's nice to have the function for the
> whole "USDT ignore clause" stuff.  Put another way, we *do* use the function
> name of the underlying probe... not so much for naming the uprobe but for an
> extra USDT ignore_clause() check.  If we wanted to, we could get rid of that
> check, but... well, that's the trade-off that we're facing here.

II would propose that we do the following:

- For absolute offset probes, use new type DTPPT_ABSOFF (or ABSOFFSET) as you
  suggest.  The uprobe provider will use that to know that to put "-" as the
  function name component of the overlying probe.

- For the underlying probe, store the function name (from pps_fun) in a member
  of dt_uprobe_t (fun or func, perhaps).  That can be used in ignore_clause().

- For the underlying probe, leave the function name empty (to be consistent
  with the fact that the underlying probe is a uprobe, identified by dev/inode
  and offset within the inode.)

This way we no longer display the function name for underlying probes in the
probe listing, which is correct, and yet we retain the ignore_clause()
optimization.

	Kris
