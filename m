Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7BF23D289
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752005640; cv=fail; b=LV7tRdUT47DF3YSYqn8M1y5CQ9xySJDiL2BKqtQu3ptSoceS6jqjPhbMyAJFDJgYSTqU4rBVqUu12dUFxPD5k43njHsGKqq/HalP6JFRaCgnmWN91ihRLjVGEUUa059LofEmifLKodh3o6B0wdGvLJ8S1LPjBFaHLH9gxlwMSb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752005640; c=relaxed/simple;
	bh=S/uSn1oR1cfAFlycXLEjKo1qifpCP/y2AhcpSApwAyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kq/qgC4yPKrC0/KZvsV0HcF5oOS10kTWgcsDiRijzCyCKR0uDXGLutFsz73qFoDItGaM+FpINYlpPj96wJXQ4iNn/vPctpl5WUoiW9YdwVeMcKOAdUn7QPH4X/vVlJU/7tC0Yo18X3PNQuAX/EULpJTVR+P8euRl6NUJLlWz/Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SyzJ9QuA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ijt6EP1E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SyzJ9QuA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ijt6EP1E"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JHaHl017026
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 20:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pi4T6gZ2BGHSSi01H2
	mWPK8FTSxJ+Mk3xonSLAl7GaQ=; b=SyzJ9QuA8WtoNEf8xjNkS6TajbhZWuZxUZ
	8Cz5vG58BCJTtQla5GOT6XFjTjp6Ce6FwMLQJ70lO3a8/Sb5hxJMffMb+H2T1HX2
	Cd5DKhFjB2cEuyCMH5ceK2SWCWjHa9s1drUl1elB8mi9dwgFg12SbCOwwNDL313+
	7fqmTdj8AzJDGBdIeTvpdJ8yWkuPLCvLw/G63gBNyjlEls6aT+Y5y+LTxnZRP/5x
	Ju+qf4c9l7VlaI5okHNDgG6xlX152eMEaQCeZjlAt5k/tA7E9L3isnddKqcXhCSR
	rKGBqVpV07leSj8c0vOZ3fSTmUZ5eO52nj+F4J3IUi74Lw++oMIg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47s9bng3ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 20:13:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 568IOALj013546
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 20:13:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgaug4k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 20:13:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dox7OTZGBciRsHM1IRmcrXTqYsgU7a0FELEb2Z304FaUI4UTEasNNwfOx0dyFzYW6oSJeo0IanG9itdGsYFUSf2WP5MPC9XdBvtEhjT4hsF9G0qsbMFwJtc8uEq0jyatUhcdXfPk5MiITBTUf1Ah+9XJQZdMchMkrooxCUv0kosVzHxVfOr7DYkmzlVWuUs9C2j1h9LE8DlaV0yo34aaPHE+1yEH46VFJa2bpfiU7018NF1oXXcPc4Duv6Dl0zWaJyq14aWG+toaRBOKXiyBhpCJ1MsawwMwcr3cIuLCr07cOOfN2+9HAgzMvx6a5vx5abY9A92GQfcGOziMbCvsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi4T6gZ2BGHSSi01H2mWPK8FTSxJ+Mk3xonSLAl7GaQ=;
 b=TAm+koKtDwKXo6FwOWE4wq8ik6Z6ta+JvoRa2PmIESHyrrfwuYM/9cplOPEZHzdSp12DTGPiXEDSBU3CQsJpuYQCVn2wp+z/w3KaZzkBd2zOJrzvpFK3O4ip5QWFyKD9VRWIoK3wXxOgLS6C+rNaJQJjbDkS58e4g5B391x91O30o/a5BnG3Lva8D7VOOmvDG4rq7KGrbfKp/7ELFVO2kU3lp4jx3drTbCVeFARbzGCCvLWCoxYgNnnV1onLOnG6OyC+Uj3z7MauxOaw5JsAc7nJGpFN2DX48+S5xEVMRQ1nrQLuFg3+WhmuPIFVkTKGrLXjatgvpXmqvidFLyyE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi4T6gZ2BGHSSi01H2mWPK8FTSxJ+Mk3xonSLAl7GaQ=;
 b=ijt6EP1E3AfzkzrHPKGNkCrd1tgv1AGGvWiq080U1KtGGsqdeAJGSy4QDxJH6sgHDNWWc5N/bymvsw2clp0LMF10xm9qPg2bpkUqXpAo+O3ps5qq/q3uIxkOioEGauXTfr/8iLTk5XPe7bJCKMrlTMm5D4TWewfybSavgDGHmgI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7173.namprd10.prod.outlook.com (2603:10b6:8:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 20:13:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 8 Jul 2025
 20:13:52 +0000
Date: Tue, 8 Jul 2025 16:13:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aG17/ZbpZHUCkE+J@oracle.com>
References: <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
 <aGwmKfOPU+NZ+ekf@oracle.com>
 <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
 <aGx1n+VfTcUaHIq6@oracle.com>
 <7acf8a29-0ccd-4efb-8b82-92b0bac6cebc@oracle.com>
 <aG1VxM+BhwPPv9hv@oracle.com>
 <db9e497a-b2b5-4b44-840c-efdead15fb9e@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9e497a-b2b5-4b44-840c-efdead15fb9e@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f06b7e-e99e-4694-6cb6-08ddbe5bf560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pfAt+EXEzIeI1Z+Bfhjzbzju71dtjycI1jJMh4CrRojXw8F0i1zeGXcdj1cW?=
 =?us-ascii?Q?JzI4ztxxnEMVJPmhHvlxifrRpEdFqpYdBoHQxJPpHorMgfKnc0pN6LkqqoD5?=
 =?us-ascii?Q?xXNCw8bqZq+YfyeIiSISPXoYY7uUa65AWgeu4UJoudxeEzTagkV+u3rp1NVK?=
 =?us-ascii?Q?MFCIIQPu33/EFs1D6VvFPq4GMWBJgJZSHIX95xRpaivSwY8vFWUuHUv7UztP?=
 =?us-ascii?Q?zhgya0zr0CHUqo/9IwjG12IOy+TxN1+2Emu/loNeGiv74h34u30asPQlonZl?=
 =?us-ascii?Q?1oaYryGhknxOjnVVfM5GYAQia7y24JKACGu5Z6JQ15/qbRuSv/mkwYg+jlHy?=
 =?us-ascii?Q?I8VUvdUNkCZDui56TUrhvW99AxUF7lruKS4TPPg24rAxYCdQLwDMKhSQ7XsC?=
 =?us-ascii?Q?eUNUphUEBbHUmODE8cV0+24dImdFGDPO/lWXZbs4p5QWx6E9WXgBHQmFBN3F?=
 =?us-ascii?Q?cmoKcen29QhFvgWayUWUH1kAdY2aqVvUk9ALhYWxOprw/a7wbiY/QwYMqY5p?=
 =?us-ascii?Q?7Me7B2H+Sn7/P9gHQeMCSQiuyqKUdjuYcOjJbwDOhG8tQkw0TsTwItQqZy1j?=
 =?us-ascii?Q?0j/0bsQpjGpQXBwMtq6rM06zCJ/wLAiqjdMswOLUhU0Zb3oEkjjRTTgnv8TL?=
 =?us-ascii?Q?Ul1Ot8neLGoTTTe4l3nzv7vEJHq2lnGDYYerRu5xwC739xK43M2jBlp8QRxM?=
 =?us-ascii?Q?4lrVpZE0zDsbM14dohp7qe8Yd4OCyeMh13jtxtD9Ga69T9Jr97KXBHjorNES?=
 =?us-ascii?Q?mF8owmLO4yF9r3AH9lbDC4AzsE79ZCa+upgnYaopje9e1X/apuqTQkARHYFK?=
 =?us-ascii?Q?gfdKjSfetGogpjI0utSwEKz2aEJ4gHXSrXELwlNDFa1a7gJzSJkl8uiYUZNZ?=
 =?us-ascii?Q?mHmQpzuUw8IAyO0OKxkEeeL4MfR8KqowH2LBBYwBpl+LhJI+yZyS3Co1CrzX?=
 =?us-ascii?Q?uOKJghdJSKWN3VrrUqFpGHFuaHfI5wuRRFLjU2oW0UHb5GY+HmaxiOclDCmw?=
 =?us-ascii?Q?v4Kx8T1jAfhcF98fphdX+Vs93mNXuIW3m58wQ2qEKWE2qtMebXdR9Nf6Ym6C?=
 =?us-ascii?Q?m/+8VceC0F70Uqz8VVrohlCZQx7JnbBAPAq0rzYdi6cM77gmJuQsSHP1xsAg?=
 =?us-ascii?Q?anAPIo+NGh/7dtZ+1wkNTEdgGwstUqjFFjJdqQ/8q9E56wiAsYTYY7WuxeVZ?=
 =?us-ascii?Q?WOm1+AShnFpk2KpqrOSqZJmTUNML4CG3Nl/+K8tQTYEJHtk/C2uVltRpwQAJ?=
 =?us-ascii?Q?LTriHEIr7S0BeZRfRkjFcv12QbGWZkfTSAwiZWPal+01liAefBRsRotB+jc0?=
 =?us-ascii?Q?oQmSRnoBNoBWuFjX5YEPzSrIywC4JvL9+rN+siYTWv8NcerOAEZpYleaEmK0?=
 =?us-ascii?Q?LJdDnX8A9AYrh3Ahwg2lG7wetmUbTePYEDqe++V1ho/5odhpX2axMoRumrtt?=
 =?us-ascii?Q?3+jiXQdk96Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?22m8reXQ+H2WXNW+cD23blcpWmbatHJjwr6DmOwCyLwHalZ4P2AUQTbY5ulE?=
 =?us-ascii?Q?MBW8+QWCVzYBlZNjlKJ+Sf4D1pWV4qxVwbaqJlLO16pofwMPZGNjz7DUYRph?=
 =?us-ascii?Q?v+hx0izD8TyjoG/0EQVJybUeCNMPgGhsdViRpQ8H03OE/kDC0eF3DeTfnGBW?=
 =?us-ascii?Q?B+hQLNRWRZtYL5tCmm9ghsK3LO/yZJsiIUgPycbsjld/W4oY8UT3CDNDJCny?=
 =?us-ascii?Q?XAopFyMyd25pHgg/HAPM/ozOzEdtAL64CwUStEVHnjSOdZiW1H1Re+JufRz5?=
 =?us-ascii?Q?PMLe2kjo8vTgO/TDHMhmvwrSW1Dv7kCCOQqryltkKbYUyFxaUKlsSa7YASWo?=
 =?us-ascii?Q?bNN2+ilaY2zYGZZmm7Q25PBKabjU8vmrw281jeiAODcxwT+SawNalWPnRPg3?=
 =?us-ascii?Q?Kg65CCxm0A3CwSRiGRop1Jo0PoQsX6Gnj/cB5M4p4p36+At7GuiF6ISvlN+s?=
 =?us-ascii?Q?Htc0hQgf6NFknn9zhXSddbM8K32bgdyvA1LPpVN2fcu1Mf7jv2C4aOmz0T7k?=
 =?us-ascii?Q?SKAY+7JHU/9WsstUsjg58yUe0SgnEIILq30su0mw/w9/DK/ZFHm31DGjx/cj?=
 =?us-ascii?Q?nrxJboy6B9xAzMhtqlB8aDwOtnX0vh60+Rwon+7WS2Zf3qLjUT6pw1IQDeAs?=
 =?us-ascii?Q?bPq2UUVFrEeMN7tRtbs9QetWjTS4Z6qQZpw7JlF2861zbk9UD3qBebC/xYDG?=
 =?us-ascii?Q?5uo6CauSnpVo370glAvRkNAd6JAZGW/IJkbzUmYKeVMRL+E3hLfGZrPu6ojr?=
 =?us-ascii?Q?9020JwQb6olIv/aoKiR8gvzJ0ETV2O1CvfB9G7GtZ5TsbWszglubc6A7jZ2c?=
 =?us-ascii?Q?DOIehvY16Tl8D1K6EEEftziuQDAlImaIimohi9vpRedsKz15FvqJiMD38SWD?=
 =?us-ascii?Q?ofQBowETW3FYsj9JZxc1lHMEbhvwTvX/rGbqWBeiCOlNd4t3Cdsexzvd5c5L?=
 =?us-ascii?Q?Lx20tV+eS/tO1yHKHjiOz/g88Mxn01rk1/rNKHYlxdldjXC4pH2jb+xO4ZJc?=
 =?us-ascii?Q?NpX+XoXenfcvvq2FIozJYjy+QhH77hKkoPFs7CKpqtI6wOWvZGybGa6lUOgv?=
 =?us-ascii?Q?YIJ0Df9ydBzbfpGMYGX4JNpExMma4Wdo1Q5u5op3mvtjPJ4vCZQqoI+DiMki?=
 =?us-ascii?Q?8Decp4ykStaIB66MIQEdgBToRLJyT+mKkw7zDxuuYg+b1takVS+DXqgvt8F+?=
 =?us-ascii?Q?e5K+PA/tp9UQwLZKyuNy1F3yL4TwvaNdOaHocZSN+iIlbUXjtoBGxOxN1j5n?=
 =?us-ascii?Q?oOyBZZdYJgGGTzXhvll/t0dX7DaTUQwCYJ2rj3zw+5sLrx5nKkH1/JOoX3mA?=
 =?us-ascii?Q?giUiJUeUYHGzszhOFxUH6b4fm2IVNVrCydDt5gcsatheHDHZmeUKuSANxpaD?=
 =?us-ascii?Q?EB1ck5RaB+Kp61zNc80sHnW7NqsxeY1ig5wrUs/j7/0r9h/VhccdOuUjgUDK?=
 =?us-ascii?Q?aJ2q8SCZQzYgip3u10439Apv1oeXerUrF3+j+L1RDWPqiO8box4c2vw/lJ2f?=
 =?us-ascii?Q?K7mph58O/pRHcahS3JwEr40htjDwNPFC+PXMi4PtNsz463Urywgkvcl22Z8e?=
 =?us-ascii?Q?OViCIcSHEmNxxihLGk0GIdZumo+RITFm3DhavH1KLVUbwrHnUcJGmEmK7UQp?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ASOAWWokQw5k9le/vg1af3jj05Zt/SqgZ0LVkxJQcdqViDciVwbM4lAoE5V69AD9r4+YCBEeULdb6IGXru6MumpEH+HVo3X93d9jkT+GimksMA7CBU5fIgkLyzuK4aAIrKcU7pFb7NlGXRlBbDzep/jhEb2N0qnn/XAsA86h0n2NA9wgkrjETRkW8V0GM5sYm+GvidR4Q82OIcTge4izy4RPHY0sXALNTuNF9pyFKzPjuKPtnhrsbCEzx4hLONXcZyfIYNNCsVMYb7bsY/7zIzSKl+5LOC57D6iwJVeeSXCMbEfeOxyGdvm3baRgmknhC62LlnU0sGUr/xTMVKPvdCGU+647yQONozhbO2C+J+jE6W9PFM6ZFvG6c53N6zcjwhwaJBiy3pQ09b6CPazt7gcvZ5tuQV41WwAy0qOne/q39c+MNHt5/KXTOX4fWh5APcS9Rz00fsV3xR78mVTweOy0g0+UTAOL7ULY2pyXJqNyoMHuZ7X3qkGxE3MBq013IejcYA8LhJaHeYuYFxN6iIKwwxVLlea653ZucUvov30s7H3jHjg256WEVeP1x0mZEzluhJeYf2JnJPRzWK7c8IHI3v8VZQO+xXeTF7dNGQ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f06b7e-e99e-4694-6cb6-08ddbe5bf560
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 20:13:52.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pgRpaDtD0cQSWcnVPr5pNj83xr3vvlpjIZcqoipxV90KAzFU6N+EwUIu2+JQ27pBgLNa3NehYSaOvy2GJCo4AZ6ge9pcCLc2gif3XeSAfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507080171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE3MSBTYWx0ZWRfX1NQFcP42IG3N fTbaAGyi2X+B8AT2IV0Aw7u/HZ8gDMM29Pu4dq7eb0ZPiqBtgTkqBLbwptT1zXpwGBU5Vng29jN EHtOHYKHQMIFZyFNVTHpGRjTfLVNpGKWNHo96vUNh28NwznQdsOsifvAFhOcc2gDgnKcRoZbPMJ
 DuwxnV+TxO0FvPXwGH+o+XddKUfyojL8Z6899TT0zgmnN47Bc8u60deD7qylgltZGhtdjRltUFs BJ4YV+5a0R4saH14OtHhn25+LFmvHwQs+GUKu5tygFObZbUkrjbvJPKB62v3aaeHrYoALpKhqAZ bBLe33XmUesAKeOHzqlrszxVPrUEbyNJfz4KodCKYqnJlW/sZ9glTLREiR4JWTbTky3h7oIdknh
 O4L3OMew/vmdTkuvLmDtWbKjGajiXcqsxxhpVbK/Z4vKKXGh3UoJyjkCI6BX/KcDus0rrIta
X-Authority-Analysis: v=2.4 cv=EPIG00ZC c=1 sm=1 tr=0 ts=686d7c05 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=wL6rtW4OA2eKa5yj3gcA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13565
X-Proofpoint-ORIG-GUID: ZBJxW6RUlmwqlyd6lSeuM2rb6iouJLIA
X-Proofpoint-GUID: ZBJxW6RUlmwqlyd6lSeuM2rb6iouJLIA

On Tue, Jul 08, 2025 at 08:04:41PM +0100, Alan Maguire wrote:
<< omitted >>
> thanks; tried with build/run-dtrace with same result. However by adding
> some debug logging I think I've discovered the root cause; the order of
> .d file sorting seems to be different in the build/dlibs versus
> /usr/lib64/dtrace case, and the problem is that tcp.d actually
> implicitly relies on ip.d for ipinfo_t . We get lucky in the sort order for
> /usr/lib64/dtrace, and because an ipaddr_t * gets added during ip.d
> processing, by the time we lookup "ipaddr_t *" in tcp.d it's already in
> the D CTF dict. I _think_ the ipaddr_t * gets added as a side effect of
> the fact that there are fields of type ipaddr_t in the translated
> ipv4info_t in ip.d
> 
> However in the problematic case with build/run-dtrace , net.d is still
> loaded first, and then tcp.d is loaded immediately after without an
> intervening load of ip.d. As a result we have no "ipaddr_t *", hence
> 
> dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
> IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
> } END { printa(@c); }:
> "/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
> resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name
> 
> To fix this I think the right answer is to change the dependency tcp.d
> has on ip.d, from
> 
> #pragma D depends_on provider ip
> 
> to
> 
> #pragma D depends_on library ip.d
> 
> This is needed for other reasons (ipinfo_t declaration for example), but
> with that change the problem is resolved.

Sounds like a good solution!
