Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F541A073F
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324949; cv=fail; b=mcEmz8TQV5OYwxZm6dy9eeRQSoP3IKIOepxXEG7zPJYVxiZ6V0dgEjNUJ6yTMw09SxqvcDwJy+UP7MEailYTsqDkLBGbXfK3g90VAKYZ3bkBxrrtFji1Ofg4mMjTOeluoCkYe0/+nMsHv/A461Ry5aR4jN58iQly17gBtwdm9Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324949; c=relaxed/simple;
	bh=ngvwmEmmhrfRTXO1bjblYCPqRWig7zIBPP98fI1b+hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h4SlOjneJIxLspVZsGyAw+UNkYr7wWyyNKM+v5lppCR1jzv2GW6vIKwMIeShyBMk6+6IA+ZZx5Us+9YVVhgtLtR9PkNYaLsQ0IwFYLyajRdw+iq6XQfhwZ3TMO0BqgtAZZZib0NdkLFQCMx9/k63Xrd59pc08zNU7/BOQYW/Ols=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UwO3lwLj; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y2bUg1RO reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UwO3lwLj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y2bUg1RO"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIBhoj008073
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=L4ByK9YUANa4Kls1MM1waFf3GR2ONWW8rI2s5wt+FLk=; b=
	UwO3lwLjVPi2bwEzxLA0Tx4sOyefoB5Nw9B5lfhbcufSyOjahqG7heoUJ3YO1bZI
	jE95+G3xw1U6a2tCEYP8b85iZvc1DInBWjYt4Xfr04bg5Dwy0dOjQkFBvg5120G8
	rY4nDorkf5JXqTf7c8KkBmFuuc/CHyQs4i5vb3JOGS4VS53encyGR+PtBNCWg+w2
	c9WsPAxo0FN+0kQ0fWPMs4fsq/f8kN0NXTD/Smgjrwtz9OdVcfBIg6N35xlED+x7
	PuptT6A914L2H/ZrBMAyaw1HbKx1vcE9JqhtOVm2Bq3+Ls1IYTqHqK+dkyehFd1G
	iprLGroBHeGgPtFUf8zqMA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx3g69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:09:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UKpEHJ011459
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:09:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u8ra8h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 23:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gook6cKkEKKB7qYeaF2uIknSCIoiPbSvk1nji3YOJvSLeH6hQaYoHc3pb7ucjdz427+Dc5B8mjbTebml0EuB3sSfqkJ2OqWXljvJo8BHnitipF1Xm1uHkgVBBYtgDXrw6NI44BrRpeFS8YOONohVB2GKXqOhZ5acZ+0sDORFQwBEYidC73MG450swS0rlePDIhFqR15rd6OGAs5XzgagRcIyAP71dG1U97O/onhzP7lCbj64E5Srt0Wi7zKQSHoFHBgbtyll7RmQ8bFDz+AB5j0W+y2tVKbndBiPn/MRt4Jqiu7P56mbnVQmp8emulGzH8gXXvOmhzY5ZKqCCXw4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AyhNe51yVZ/w8GFChQPhMUVrRI/lvGIqgNNPAsXOJY=;
 b=fMX1xHmN6QTxVqES/FFw+kaPMMJ0yu2zQI30RzJVQTaUKyd/aB2GvCfAv4/0fa4AGbAFN6Hh0Qg/qAOiDVuaSA43f0HDtNXHDqNWg3zL1g9Rria6kZbA55KFK3CSY7BVWg5KkZPPmma9AVBBgmX8LwObWhXpZemh22XcV1m145qcbh4I03dLzO2P3seRaUAVx3kruZiv5ysxrNYue0BM2p5EL3FkXXqf3czvVsBDlA/zqC/krMfFY8dTRKULD5FJnuofgbbxhhfVBHoYyI2Ns2kiWITKSTtnCexCKvuptg6nT6tTUKf9qhkxotcdAjkyCpmW/28iCmbO5YBIBL+dHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AyhNe51yVZ/w8GFChQPhMUVrRI/lvGIqgNNPAsXOJY=;
 b=Y2bUg1RONCQdgonp6AEM+Vrv2BXSqfGuG1yPh2P8vydlDwC7UErM7ksASV3cIuTfY96iwngN2iHFq3oPNHeFm4IobrJ6u0dzWoPSU+uQOHfM0kxshYy/tJkifxpTQ0LCojywRqDFdbnpH96Yx81D9wAaLRANe2h8ofkWmBWkfjY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB5969.namprd10.prod.outlook.com (2603:10b6:208:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 23:09:03 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 23:09:03 +0000
Date: Mon, 30 Jun 2025 19:09:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/3] usdt parser: make sure prbmap is cleaned up in case
 of error
Message-ID: <aGMZDK633uF51oJ6@oracle.com>
References: <SJ0PR10MB5672A2F843CDC28C7266DB9EC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <c1bae7f0-6024-6cbf-8dc7-61b7ba1b99ea@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1bae7f0-6024-6cbf-8dc7-61b7ba1b99ea@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e441e92-6b47-47bc-dde4-08ddb82b1b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?S0msxhcF+V9+EYV4FH35A3AIRHEARkWrY3DLhNEjkcn/ZFEkWJkfDsenv+?=
 =?iso-8859-1?Q?Gb6qSFDSTjAUiChMqRg8BBhAcXoIL0aLHZKfpl2hpE1pBURnzcIcPs8blB?=
 =?iso-8859-1?Q?1RYHrPDK2dxfzjDlK7eW+NhMVnarvQbf8NdyTQjzagj8Zmyo08mjJF91Al?=
 =?iso-8859-1?Q?J1GI/0eDotSVujDEoreOWDUG+6ILVBEdWYSeAC6XTs/ekQ9H666V2qfw1X?=
 =?iso-8859-1?Q?9/P91prK9XAIZC4BnPNZDdufSZzIvAuHAxTfwyRkKWpx/TuveQ74fcToPg?=
 =?iso-8859-1?Q?iQ5VR1yscNYceFsNcTW3nnvCQsknIuiyERrKP5Wvs8JKg83mh4+kDDi9Dn?=
 =?iso-8859-1?Q?p3fWg30cS/80ovOjnIbnq0RgxeNRHFhUJec3P9fpvjpT6MgZzZ7GXPE9x+?=
 =?iso-8859-1?Q?4GPTb3U0B/60Hm4Tkl0Hcdi4Mh9Ic6vH3rehGJSoEPYM9A2PX1HUNS3RlY?=
 =?iso-8859-1?Q?Wd1rDZGC3AJ9ukrd71dTn0n9ZDU8g/PEz+Yn49OYnZ9tHfPWYGsjeyxeHI?=
 =?iso-8859-1?Q?jthKc3X4TpRpJuvYM02oG5/vyweXFpTiv6N7Z0m0elCFz0xixqSMUU1E17?=
 =?iso-8859-1?Q?1nBXK7wPPKxju9pAsHSiDVKF9y5BXuyhuCKeG01jZ4ECyelzwgBw73aeTV?=
 =?iso-8859-1?Q?HuwteOPFN3xQG/Y0avD8NTZr2CzDHGSqx6MQcrE6zHgDX9hFGDmIcN6aFZ?=
 =?iso-8859-1?Q?7zJ20GKsjYRX3ZtA6ZMHzijBHkkzuC10jOaxwKs4SV6mOWPSvUGgNH6rfB?=
 =?iso-8859-1?Q?5SjCS5wUdIlDKE/3Y80z+YfbqotXeMybsgbfbqdKXVUWm6hkXUq98QZ6D2?=
 =?iso-8859-1?Q?PEmTDcqbJ4WLcQCfcdJfJg/Rbm7q3Oc35skBdMrRg+c9hIUHxM7F037xWQ?=
 =?iso-8859-1?Q?O0u55TDSNJSfvS9MnJ6CdcGbC7SjAI9UfAiL83Z0yB6GYHFOGLx1VTxhOu?=
 =?iso-8859-1?Q?P1qXNtWewgmYtgVk4O0EgmMUAxTa7ZPkbOHZi4eRKDPZ6lF+1WT4jgvoby?=
 =?iso-8859-1?Q?30EycxXgb7rszJqcBEw/mLo0cXyOQM2HmaS+dgNaH6FZ2T5KfYXdJUC2ef?=
 =?iso-8859-1?Q?W4VtZHryF4Oo7+ghv+wO+cS1yAOMYjDjcJbmkTiwhOX8xZcRRj/Csuhn1D?=
 =?iso-8859-1?Q?JnIaYn7t2HqOFmJeN4yxPLRmM7krG4LSa7B1UhQdxzL/Ns+Oo1VaEnTGX+?=
 =?iso-8859-1?Q?uEriDxLOVOXHnoK9J+y0NcnpTAv5xiSqxk7spayUBrvN4c3X8bYZLeDb9K?=
 =?iso-8859-1?Q?kLrA9Plxmg2+IE9jpecxyQpCxhN7uBoqi03c2lKGagVG+5EGBR9HGrGoM0?=
 =?iso-8859-1?Q?laqG7w5i9D8Sl3MzYhru3crv8pSaDfOzCcl6R98reHAx+7RNS3wtFMPJ1L?=
 =?iso-8859-1?Q?N5ZwEn0J6hWNuEBBHE8GX7ERX9KyGnU/Qvd5ozC8IJyhHYL8+Z2nLDviQl?=
 =?iso-8859-1?Q?xM3Y1EKHGusoVvXjEyqY1H3ZqbuPQpnTmSPC/iWBP37vipQqwudDQBGV/o?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?M1bJ5RfeyigUx3B8Z035VOcdAohe7WH3rgeLGabkgKwFvDAURHdk1Az44/?=
 =?iso-8859-1?Q?zCDTo1AOLawRsWV+sAmr+09VzKyzNoDh9IDqJZ1iTgHO+0hU86QtVNoYlY?=
 =?iso-8859-1?Q?y9rwLcrnj4IDnT7T65a5/9l2wRZV6ngdFuRiceC8+GBSbl/kjMjKAAsA7j?=
 =?iso-8859-1?Q?ZNnXZorWyAR2JR5ZoeYRYL06H1839l6JrICMZvkDuVodLw3PwhtKNlLA+q?=
 =?iso-8859-1?Q?ORC6ln4J1awo6KBtWhV2hmvAC2+xjA8Y1s++E+2h4gRYEynB+Ss5hfzeR0?=
 =?iso-8859-1?Q?dnihRwj58rbAQiPtUhmarnzWhzAhx/JzM9Z8fpAalvtbv7Z0ynSY7bFWDU?=
 =?iso-8859-1?Q?peMgQjC7okROL1aDokNODHRwGiOGd8ryF9bxWOFcyEnmcc7+15/+UROvvo?=
 =?iso-8859-1?Q?m4HQdhOFco8hKORaKsiwV/ww/7FyzcQJIrp3LnFOgLoNc8CkmR239sWRlW?=
 =?iso-8859-1?Q?COwQbXZrzI3R/S47/FnIdJvPi8GwTxFhp7+GmK0nCcCnK8z9LXSd1Ry4PW?=
 =?iso-8859-1?Q?HInxLDNT1YbbTSjFjvb+iWTzMpV1y020UzS/tfWj+6okI9+1mUyaw7HLxc?=
 =?iso-8859-1?Q?jX7yzslLYP9aZdtxRxNL6pVVETEhe8r297NLSObXasLFc49kDNH2BGGvrz?=
 =?iso-8859-1?Q?zrk2qLEaJCbL1h2Q2fqZbm+PNFGQf4VO/PXxS48kJBXyhAau7CvUfxXywp?=
 =?iso-8859-1?Q?w1ScSyGmrQVUkNNH9Vy6kgnGDLfBtDjjZsGgP+3xE6wWn+ctd8wuywC5o8?=
 =?iso-8859-1?Q?iG69koIiYTzbaVBQQ8y4Vy1Ex5bg2mIeEEjPjhx/moR10uUsUwLob6Zfm+?=
 =?iso-8859-1?Q?zztbfaAWGzd+9Mu5cgO+9e3OtTOTs0hM1WdrYdtJDYhrEMD9YAcvSp817B?=
 =?iso-8859-1?Q?eAsbsBZ4Yu2HTpVd3bMMbXn+7VpfgcVRUedNs3Rv6SaOaJImdX6+Z4TIg9?=
 =?iso-8859-1?Q?dlYHQBr7XrLScpvy8f/Cgu2HckwCm7gJ3djhY5aRC6v5zF6vbqytPccqpO?=
 =?iso-8859-1?Q?DzXyzai8m7XITX6C9VNFyCxlJBNleZQGQcoGPt9o1+6FW2jrD6CC7VeGyO?=
 =?iso-8859-1?Q?BTVI87wXcRfhC8ChcBffuQHe3NPIC1AkmEF/LLU5kPl7nLGgi935XdOIdA?=
 =?iso-8859-1?Q?uxu4Js8ayhKAkKa1s0TxI/37pRGLGZWfvFb4Ba0BjkWbhcgWs5Fk1Gv0jP?=
 =?iso-8859-1?Q?ud9mbM3xHxvgJBh6YnqxRD0UeEjlq39pCM7NgPCv+c6isSSGmo/zZojdCs?=
 =?iso-8859-1?Q?3OxY+/HykrE5ervbZRsJU7rwuUtOBhQl0apUsh6QCpHInFl6FIvICZmpdA?=
 =?iso-8859-1?Q?NbHnx1Uuvg9D3/f0znPlppTFXIZUIvANbNGYDV1n4afXvEjj6hNq3M5H7q?=
 =?iso-8859-1?Q?KJcAywPbRLDdYiJgKWuy01wDlJr+LoglyaiGfnsuJSvWYbKZinf5bZPyIQ?=
 =?iso-8859-1?Q?CTJjx3VayIRmu4+5waSGrcdON2lC7xbt7fCtLFz/b1wghvBvE2zHt1zQwG?=
 =?iso-8859-1?Q?IM908UKSplQuGj8S/mo26UE/SMg/pZZjuR6vUrqj+Ov7hKy6NyR9F7iwhy?=
 =?iso-8859-1?Q?NIRPg6kZfeiw68xYsfFt1EFom03cBoF56jor5IhcllgoNq466ObYVOhH/H?=
 =?iso-8859-1?Q?eB9ldTcZmsrKgwd7UP1YNmsJ0KOuHCH080kZ+0KIiyDj1oojekbe1A0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tw3d9nOtVpv5U8yKfePl+M3P/AQA2gLvSegg2kmk1jXYBydwFXIJPmtuNfA9bExLE6ddq/nTwWBmIiN16bBz9zpgxq2r+zfQD2+aefU3rTxjLDeG+RM+4g2fkE/dekX36mfSc2A3QQ62NCn7A6weep4WF8LR7F6V2w2T1WVklBAqTaq7krAYbLA7Ld1IZoguEY6X5PomsGZSvt1Ti1o4hqUvimbJFx/UhWaX3fpOdXYtl8DxmC66sFJBJ9RmqNoW/omjsRUkHYW32lRlNmh0XvA+kcJ+JwyOgO4ZQU/dz0n1btctDsPs/kad1/BavtcP5iu9feq97xQkL1uL5jjv3bAVBeNhXg6wBRVEbnKBRm+b35Ki5O0vEZjR6SaplIfpwTivV4IOcgY149qBL4TvAkFRGfbRlhHFd+GV6WFHVAx5nNanZti68wSSqx8f6Tm5hvreb/GWy6rLiUBpc7k5ujJs67Uou8Eu1LQm5hKF0COxVsHJiavU4WsSX38xmFagd/pf47P5Q7o9Kc90Tnvus8gicRZ9bArSqPqQQGLSkDYWD/6zzG88wN5lQZdklg6q740DhxC0xVeEhb+ruopaQq6QrNaX+OLZBZx6qw+ijr0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e441e92-6b47-47bc-dde4-08ddb82b1b45
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 23:09:03.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiQMkLanK16j2NAMQ174QhlUAdHsnU7K5O0CyUgZUoThXWhnOglndjvmkhR4vr2YUFKV8tupct/tnts7Xp37WAnftl2xrSFoWIa1Lo5WeDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5969
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300190
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE5MCBTYWx0ZWRfXwhZ9O14P2hMb NJeZ/D77gomY8gqzDZ+DzW9rtbtRe6FnZsTqCHWwkyQMkgsjAWiwhPGVSSnFR+1kOJftzKu362C OiKLs8KqMhaO7l4Ddut/ZJ+gYdoreiJ79trDjqmqG47DcsvGxbav0qmTm+3tWfJCFqutdmeLhY1
 2d1CzZNrzl1twSkEdLfIaHx7vguUR1UeoIravOey0lxauefFCIdRpHm1DCLjMZRWz6+KBXLjYhg 8IIDHCBO4Mu9V124+euuRrYNIyqWn/e0tnnqbkvVFT8WycjUfxEVGwXZ/p75tW6DSCuvukb6x9n 2JdiHfDrE7ZwcbTq2my6PtWW+KGuSROaBxXI18xve1/zgU/Mjq3knRHVhqYTY6Zu3wzYZ75PM1D
 CK2C3U2lFKWU/QtDAC1o+oZuXM/YjRsOQD4nJIP05nLEUaONOBlHZ4hSm1eqFZMfG3q/l1rI
X-Proofpoint-ORIG-GUID: xzW4pEyPALM2vFi211HnqMCC86d8wtQi
X-Proofpoint-GUID: xzW4pEyPALM2vFi211HnqMCC86d8wtQi
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=68631913 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SJfOT9DMDMLufBhu:21 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DgHL8uacRrtZR3mwJuIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Mon, Jun 30, 2025 at 06:07:39PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> but it'd be great if Nick could take a look, given that he reviewed the file
> earlier.
> Out of curiosity, was there some case where the assertion failed? Could that
> be a test case?

There was an assertion failure but not one that we can have a test for since
it is in dtprobed and the testsuite cannot capture those at this point.

> (Minor nit:  I'd go for a sentence break after "allocate iterators.")
> 
> On 6/24/25 17:40, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libcommon/usdt_parser_notes.c | 13 +++++++------
> >   1 file changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> > index d3d744fb..c98c9fb0 100644
> > --- a/libcommon/usdt_parser_notes.c
> > +++ b/libcommon/usdt_parser_notes.c
> > @@ -829,15 +829,16 @@ usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data)
> >   	goto out;
> >   err:
> > -	rc = -1;
> > -
> > -out:
> >   	/*
> > -	 * All tracepoint probes in prbmap should have been removed during
> > -	 * proessing.
> > +	 * In case of an error, we don't know whether we can allocate iterators
> > +	 * so we have few options to provide cleanup.  Since cleanup is all we
> > +	 * do now, we plug the probe cleanup function into the ops for prbmap,
> > +	 * and let the hashtable destroy function take care of all cleanup.
> >   	 */
> > -	assert(dt_htab_entries(prbmap) == 0);
> > +	prb_htab_ops.del = (htab_del_fn)prb_del_probe;
> > +	rc = -1;
> > +out:
> >   	dt_htab_destroy(prvmap);
> >   	dt_htab_destroy(prbmap);
