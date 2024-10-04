Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA12178EE
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052161; cv=fail; b=abBKWAlF+zDvpw5WtOsd4DXsGf56CTq+zCdud9rRrSdeLoTJX+HJN3FKkYfryoq6e565l59NovDyGmhzEFCU1+ngnHCPnHnCaGAXHVEzube+TwkjUZElw8qXpKjQjlHTli49JdCXw72Pfg7Ybp7pORq/EZV1gMNb0413hJlINZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052161; c=relaxed/simple;
	bh=2LqOXGSFcPhUu2OEtBBULsezae6MgyrKYHj+6v6nnYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D/P9zQuMcS9ac/MdaJbIEuVRxzMmsZTPCB7dkfkmAM5PkRO02/ON2SMmip6LTdE4J4DW9zsWDruREy3wcij4lcVjFps4rrg4oV53QIhK/PiNHn5TKtVpti0XVRs+CHzLK6nJ7tuGvLLq/45K4DaDpGIsqvIOWm+/Kx6vk3zywXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Aow2UH3z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z1jjFJ3C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Aow2UH3z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z1jjFJ3C"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494E00MO016630
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 14:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=//8zDWFYFm4C8A4
	tUXtu+U/C2Mgjq25TQhRArikUY6U=; b=Aow2UH3zDIBiICWVcHEvEIEyZXkqmW1
	ha7tEkNT0nrfB8y/JurPp9bSk7hrQAdkIgVGFo0ApfYxppjUzbBj33TVtq7+yCq0
	ysNMhHV17SvLb31NS90s61114OBJHhULU5bS0gxWZ6KEAKNQXppsFYSBgu4nWTnF
	16+Qb6bU4ybjCuLzeoVYG7YlBTEK1UH4b7t/7PelHZt3ONSPT4OS+6PFuXpIlK1/
	xnutga9ZJXJFhci7zWUL9wHst688E9bvV5i/1mQeLGKfCH2MM5tFITdg92Vw0dGX
	PjehAeCd76gsZftLkMWjAyKB48M0c4QwLQlb8L/LKjn3nKq5prrLRMA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4220499qd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 14:29:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494DcUdx037929
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 14:29:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422057c1dg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 14:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6HJbil01GAa9H700hBOIB6ldwANqKTK9GojrPLIKjzVFLxATz7auBt9DKBlG4sEZ0m2QE9tKWCjKL3CwaO4eKGQtcZtulhkTnXgSRrH4h7iyVpR+K0J18236g790jA2RBBRsJzT2iy05BaDMdJiarqCxabkrTkepJHfEhTOJyhu05r85fHwmceaxWQn6Tp2LEXfKqfTYLAppylBZiBsf6qojeSyaZ2Z3ArHnP1QxMg5QQjG81lf6g6wrs9AU3FLL64enWdmBJa119Eu6LpDEvAk4UOaY9ukM1TWQzwhbjzM0m2o0uJLrSsg1RKNaeLY/Y+RnmMqGZVZZU6BLCD0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//8zDWFYFm4C8A4tUXtu+U/C2Mgjq25TQhRArikUY6U=;
 b=MYV8NMTBRdbs8dZGK78dTPaHeOvEltmBmqDLQqyDJV4XMrCQ2VdJ9V7e3ddmUpJNeM8IpIOkeO39duEZytecnztFIXowBJWk75wjnYZIwB67+BEUDVnEkdzRH+x4Z5MXevP4AgqwS1R+bhKv+3F605LNrpgBVKwkX2Dame9Jn46N2SSDGggnu3QK+0OHHi89q4J/HSoKsvtcN7sv9G4UEw2bMXorKSx/TzSfmWwh/NibSzLm13a4wz3NY7WDGRNpvGSoDizHNeHhhmJBwgKhZ/fiuCdrYF3HGnGtpcFaHeU6BQPfrhU0oGh4m1vWugPVaMpHLCdSsAxh/9MUslj+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//8zDWFYFm4C8A4tUXtu+U/C2Mgjq25TQhRArikUY6U=;
 b=z1jjFJ3CZpiOhXjJb6WEroI7Fc0AyZpj+zr75RO2q2qIyxMiIXoDnEXUQwcZ9e8VH8UU6QdvSPoLMq03ex413VrqRf8h5yqhsSEbHJC4eKzo4kghCDp46M7Qw4EDqPc/GfhaocECMID2lMdFStnpZ58ZA22H3onzQtUYAwfNlvQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 14:29:14 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.8026.016; Fri, 4 Oct 2024
 14:29:14 +0000
Date: Fri, 4 Oct 2024 10:29:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
Subject: Re: sdt provider and access to the trace_event_raw_* struct
Message-ID: <Zv_7try5KxexkrVy@kvh-deb-bpf.us.oracle.com>
References: <9253be47-c9cb-4967-a090-cc1cb1f23c91@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9253be47-c9cb-4967-a090-cc1cb1f23c91@oracle.com>
X-ClientProxiedBy: BN8PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:408:4c::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1bbf2d-04fe-4a48-d2c8-08dce480ebb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y2iMKyPJlve8iCzvZ4dDqDUEEIJYJX/3BsVhgjGfS7BX7Zswc4Th+BCzcTEy?=
 =?us-ascii?Q?qqoqKyuwveAVfS2dsSie+JIdljFVnWjGdAYc7L4v9SPIBYe0xy+/ehYA/2+Q?=
 =?us-ascii?Q?jj8M2ueGgCLepcPQpA3JGbiCfn8oyAaJRE/zspWeuRNDkxDpoIuZTHlU2NpO?=
 =?us-ascii?Q?Dxso4k+7vrV6Y4T5bS4K1q7XrjsaDkXgDBc0zEHggCu6O7lnw0QJEgTEMIv3?=
 =?us-ascii?Q?GH5/tXNNis5A28hrfrWyetGwWlGDmpMKVUSubcBj5N6SYk6ne6nIUcM3anrf?=
 =?us-ascii?Q?FeG8DAElH6OWYBbR1SDuM879o8j07hFNQb1PFdGmQGGqHkWt0Ywzky2972Sl?=
 =?us-ascii?Q?fvBuR1adIj6s8lQThe8yY16NfdmNlPOTUPoWLFIjmUFbnXm1NBQRUCcjR2GK?=
 =?us-ascii?Q?c+MNnWxNGNTXwFFst/7n5Ve45eHE20SpGHPFFAaCpEDE0rLLekw8rksShzGX?=
 =?us-ascii?Q?KD+8jShOWlscbYc7orP/J25POpED45Hur8S/KSPWGrxGvBt9eGzClEKuohcP?=
 =?us-ascii?Q?ju5mzto3nGJMckpp8NS86ruwcXfaMzqu7bjgQiAxBeMYAMw1PS99KB8sJziY?=
 =?us-ascii?Q?w9tInj4LUtVo7vCOmBfRTFaRWysAz0c8Dj8v1kXTg2zveJzVV+H/x3iswzqT?=
 =?us-ascii?Q?pdbfi1sE9rzNJ0APTo6014fRWEiOfMPbXXwlmvPATV6CxLpDf9cJXPhzJXAd?=
 =?us-ascii?Q?cvfKUBVQbEPJWgGUSySAbP8KP9m5Q8VSJ5UPawU0XpCpVqdJtx8/ag0eRmC1?=
 =?us-ascii?Q?tHESyIiMCj12aoDxgLO6TgD2j2y1CgnIGLu61an0r7ox9asYaQmBI8Z6ID5L?=
 =?us-ascii?Q?E2POPY+HCuklguIEK0RnqSSPtmtUSWBt+VVdNjOdZktdjCsGRZTBXaf/YU+Z?=
 =?us-ascii?Q?4y16b1k1cY02Qd1twEJtnGso5zi+JT32d9GxkO/J9cGvfLxbDgM5mp4heqRB?=
 =?us-ascii?Q?b+JEDbEarP5ztJSBIJkkzfjmdYmFf4ShXyBbjVBM+fracPudBsVgJNHfUUG/?=
 =?us-ascii?Q?UXaM+NpoVjh62YeuYt73qRogfnI25yjE+8nAYfKm+hsZAowT18xx+nmd/zLO?=
 =?us-ascii?Q?AV2WpZr9nAZ+Z3pdjeb1uv0pcLfSTJEiGFxgw5EJWDd1hssdrdzSEeSUYC6G?=
 =?us-ascii?Q?JcP5ywA6GFtikTVn6WJ1xsNuxxdwN+wpVPzwUZ1rTlZVfGGp2xia62Rd8mO6?=
 =?us-ascii?Q?vH1iqqhlFDiTvtkK7+jffRX2NaOLhezVlbyFSpaE5mG5VIiV7+IJg/tSi4CX?=
 =?us-ascii?Q?aUjLd/q0Ejt18n2lwGp1gOY/OG+oUxi3Xxl3wbtk5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JBRLkffybCHq8mrcJ2baDejioH6Iwt54vd4IaOduQtqyOT1nASgiEb1P5sWd?=
 =?us-ascii?Q?mthyp93CWNfoNm13jnK00ne/iZjHX03B30T9bQEKuZez8TOo9K6LhZ38yOQG?=
 =?us-ascii?Q?xFVU4kXRGHPVZmvUp6kiVEsU27yEpPzR/q5Bw5X6alrdWqDOKRIqrzikaco9?=
 =?us-ascii?Q?C+I6pueXfCBy1LptTihrC2IpGNzW81LGnCfseSIeeQBOQM1r8xMy/JsR0JaB?=
 =?us-ascii?Q?YBHI/0cGTwr/+MAxmW0YU85IWa0ykvgY9rAwyRFV6JZWnw4WsSLfUWTfpAW0?=
 =?us-ascii?Q?9oW8K5WfMXqsVp7/vWU9N9CnRi8wOYp1053UlN26LFdAZDOJ3yOtxk15ps6U?=
 =?us-ascii?Q?tgB7tUOcKDMMEON/y0S/6ejWEGlB/DTOGYTqziZxXFWgeEfWFqS13JTkHywY?=
 =?us-ascii?Q?WeoGB7+3ntgUZEL4VvXWfd3SMzeUAHEL7ICBAW2UYqwaY5Q/5uT4hQ2gytSf?=
 =?us-ascii?Q?TbqwErZJ7IjqIyci3qTfDFdM5tagIMR9csKgzPNVbbn6SHIJUjFPEiC6e5Jy?=
 =?us-ascii?Q?xxS/fRr6i5iqP/kdY45YC861otjYVbUl7wUsuJm8BwJL87LxTlNqZKzAnZiT?=
 =?us-ascii?Q?zx2F5JIzkEsAF6Z6GUWhnXHdsB9A4ZMVIL3jySdLCFQp+c8tLYbqjWXY/To+?=
 =?us-ascii?Q?RClbgaSNjCmk4Z1injFX3h06WzRzoozo+MynMjQVwnEYDRMFcaxcSPeQEGwu?=
 =?us-ascii?Q?YmYVkntM37ks4zfOInDi/TWptsqhcvCJhx4CHJ0RXYrhMQfPqOgHKfPc/P/t?=
 =?us-ascii?Q?l9Pre1XRnRgaQ+iBLiELUF8+gDRfVc/YDnO2W25wrLCoPMN219qCXIM0V1ws?=
 =?us-ascii?Q?ZWicdHviuU/+8Sh3H+MRDkicBeRWXQp4FZuZZpKIFJrzHtRnQajS0DK9Lk4/?=
 =?us-ascii?Q?O61xVjrqrz2S5cXEtFDEHEG7eoeaf/f5aDAk2k2cWSzkF/mts6SXNAAznKAY?=
 =?us-ascii?Q?22olu/i1hxN/jZLpXLIfYYFzoF6M+7/Zf8WmYnLv8+qJHttopBdAxkZ/AVyb?=
 =?us-ascii?Q?WAOuYOUdExU3bBZRtW3V/0btDSm5IpRJf4cXL8VXk4f+YrdWG59SHZjMpGB2?=
 =?us-ascii?Q?na5Yyfp00O3QMtRy6MbIYJjvm/jE8+E1M+ChQE8zZE6G2Up6Ac76Fu1IiItm?=
 =?us-ascii?Q?sWYwuBq7gj9rDqXLUPv0VytnK1EV2zJl+DYd2LdwAcKlVLI0FwesdCT/WU+z?=
 =?us-ascii?Q?sVZ9Xrxn0FJaHZAELP6dElkqi4WpXkAho9hfk2GO5MUBQoABYACQN2tEwfAU?=
 =?us-ascii?Q?8+pQRHJbAu3NDVdRUN7ZDrhZAKXe4vdRNNfxcvNR2Ho9eD6tZoNkuUNIS6GQ?=
 =?us-ascii?Q?USejcXw1wUQVkcmwcWcReJDj96e/FeKKVJKTRmqyEYQhOdxZ6GfxlN10I5my?=
 =?us-ascii?Q?3bRMQC5KYAzu8X3jfCIPuH9TO6dZmP5n5fGNSC2mCKnTHK0vxZYFW6yud7Q+?=
 =?us-ascii?Q?L1uKCqBncbAPvMbAAUp+lG+gtB7XmWzXMKxin6jS2f1sX1yspGavaephdI7G?=
 =?us-ascii?Q?XU3zgHSZXnsLVY4m458ZuthvSA3oigxdzqZIZ7vsqVs8dr6nXLPRSKDTh6FY?=
 =?us-ascii?Q?TpGxOzZ4HLw37FhuJ0Jg9iuY4OcK3AHx8QcGkjNlMuOlxeYn4+Wf6Qyj51bY?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fJO42h52/+jT3M/mpS2ivpniUsh4xMbkBqrvWOLhUOBwj/1JFr7P76NEhOkt6S9gY1TRUglKxD6AZGJjzmYeEZrthMyS0qhAXXb4H9b9ichvNDII0RjFk8GjMMY3m+apPI0YSObA0gDG2nIY0IcVSnJPSzS+IEGMlF/fLPZ+p2qocG2n0uLW+n0t3r8xqkSeNlIe9jiy7kAKBB5NakHV4+ljyYHjkxm1yvU7E0p7yZjn039V5MuxMIdONnK5KIgDDt09V793NcwEWgawxOPbciZvV+ZTzZLtjQCPT4tepIzZ4mxC29RGM0VUxxgH4uc0PVy/6A0Nu2X8NDxKr69g24QOFtKwTBNJMqLxu43kzSPE4dudGpTpR1SLIP9v/BU8QDaNZ960IqfFWvzGXxdGLzV7vQJ4VUgRPi/a+gM9YmmaCyaiLzYVdOPPQBoC48A4djApubUL0mitDO3X4WVosj7Mf+fKHwcopA+hb+HqsdkJOJM9UbNJLS8VzKDoo7HVXbCi6+8NbinDjXQw8pTZxaDNiKnBGow0Y9LxrG1L8fkAardwhhSJ0ktggQi/fE1zIGxRDFvRgJdexeLqcF+dcdto+3hBp/eCmXWxdLY9htk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1bbf2d-04fe-4a48-d2c8-08dce480ebb6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 14:29:14.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFojpVHw2MJPXPPbJD434898JPTWiK/1LSfi+zVwgAnJ9fM08R6Ip81PpPzk3ZMh1QZsv1BioIEa6tyZopjviEx2JUfolfpdLsSlKrhw+7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_10,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040100
X-Proofpoint-ORIG-GUID: VkQhrPgmwUnXasOpgirQ-uXo0STGQpef
X-Proofpoint-GUID: VkQhrPgmwUnXasOpgirQ-uXo0STGQpef

On Fri, Oct 04, 2024 at 12:29:35PM +0100, Alan Maguire wrote:
> hi folks
> 
> I've come across a case where I need to trace a kernel tracepoint with a
> lot of associated trace info.  It seems that the current approach for
> sdt probes looks at the "struct trace_event_raw_<tracepoint_name>"
> structure and maps its fields into args[] values, translating each
> member into a separate argument.  That works great for tracepoints with
> a limited number of fields. However in the case of a tracepoint with a
> lot of such fields (i.e. more than the number of args[] supported), it
> would be useful to also have a convenient way to access the raw "struct
> trace_event_raw_*" data, especially since we have access to it directly
> via CTF. It's possible to do this via a hack, e.g. the following works:

You should be able to use the raw tracepoint provider, rawtp,
e.g. rawtp:sched::sched_switch

> #!/usr/sbin/dtrace -s
> 
> sdt:sched::sched_switch
> {
>         s = (struct trace_event_raw_sched_switch *)(arg0-8);
>         print(s);
> }
> 
> 
> ...but presumably that only works because the first arg value isn't
> scalar. It would be good to have a helper or builtin variable to access
> this pointer directly. Maybe there's a better way to do this, or maybe
> we could add a helper/builtin to make this pointer accessible? What do
> folks think?
> 
> Thanks!
> 
> Alan
