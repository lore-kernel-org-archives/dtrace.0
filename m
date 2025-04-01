Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE71C2C6
	for <dtrace@lists.linux.dev>; Tue,  1 Apr 2025 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485788; cv=fail; b=FWCDZjCr8ryXPsO+13MDsb8f7SqYS1+MPnc332twJnKeTzL/kb/yvESgHy1o6S8xIm6EmPO4FKu49vghHrcfzpLgZDZVvEaUbE8uYHBRGR0ouTsf1DiHDYWMl3B6+ESRr9GNPv7fhX2Yi0cZGm4HtGq3rfH97GRyQhPK1NcjZOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485788; c=relaxed/simple;
	bh=jw6GtWFd7MxjlNy0VHrxYBsLMVqvnXempIQ8DdoCL4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m5fazxi/egOau0i/1DlW/BTImzJ4w2yuQwl8bpoawwzFOZpFrzphSj3XO4USQnyc/oI4huPY66MtwsbUOP+N7PKTcca32bwed5WmM+eToWWIrF1j4fic8qHkM5QSBuPfsPwPD8ioumOJdYvcs3quBVKvuhCsw9TZ6uIi8j42lf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SNTBByO8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tMuZwNO1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SNTBByO8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tMuZwNO1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5313GgjR022676
	for <dtrace@lists.linux.dev>; Tue, 1 Apr 2025 05:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=y8Aru7vByorTvPClju
	g4MMK2HlRNE8NhS7gmHwW2kSI=; b=SNTBByO8GvQcWdy26TZb0GSbdv8JNThd8b
	pa6JTKg/ABjQTb2pqhcCL2wQcar5ouTCzC2V681482HiRkM2dlCxg1RIsP9GdJ4u
	1syE/9TtXqnvv0tosfxycFmKbg6alSPNbXvn8yDoI/ozJK9bm5cE5KnpXvZDrEnd
	SgC5Nk+jEIQUFBYpcaEXvLrxy8FRvMegasewv/Us20UtStvbH897TJWkkuAq+W9h
	F3ykfuCVmEmh77gSOA4SXe5t28r0s3yqg3qxNqqYaS4a9o+g0abJLdF1OMd+/5Ql
	ZjD9hhY4Z7sB5tljDRxmwRcPJIWNxfTGYukxkq05TERJsA+7NRuw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8r9d635-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Apr 2025 05:36:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531418Fs016846
	for <dtrace@lists.linux.dev>; Tue, 1 Apr 2025 05:36:24 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a8m7u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Apr 2025 05:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbG8Kg7rZnxM1DV27f1PrEZOt2CHEkYLtxN4izdYY5fWlYQptNPv1QhP5QY/9UnvEZT7VB7F6tc6NCSu7UNtNwLdCQyi4lvlLuLcvrb9rTp1YgrWHSwPNdiVhP7t+kUS/vcStK1ruxhYvzu9++MvaboGDB5r8DC9fPcgFa8UcuzL2dU7+8MNdJTkvHEdq+hZqM66b8dl/HUDL7fAUEqwUG1ALZDt6UEd+Z+xwt/ipdb8Bm6wIoOJcLVzMcGp0byaHUULgI+6cgzPQ+OmjtwP+ijyLAB/fFL13vhAgh1WnzVXKmexE126m9hjv0xGaLmJ4ahPOOWAGWI8qltSVo+ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8Aru7vByorTvPCljug4MMK2HlRNE8NhS7gmHwW2kSI=;
 b=gCPmqJGFzcRNMbXkE9+Fgrnk9yWZXDRKKkAiZTBv+22eL+K7GiuheoXwcIUPbYASmrGvnH8P2D9IOlrubNECdUWL1mP8jjeFZzLybbVi4jymPpKsnxc6yqjYt8wFmA+6cPJxDF25go5wl9OanwMhDqBpgjUtQMdTlvbUkKvYb28cY0FMG2I1iMxwEBQsuimUR3oWu1zD6dGchg701Wlrp22F7IwTeLHC7/UI2A+Q3CoVhnS7xeDic8U4kenOai0fklm1OE8ft4G3PWLjXUD8Mmm1gvcHoQq13YXR37aHmTZM9NDyjpBSZyp23pYX2Wxoq5vaNAY/xr85/RKDE8bIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8Aru7vByorTvPCljug4MMK2HlRNE8NhS7gmHwW2kSI=;
 b=tMuZwNO1mJxolFdIVVUGH352YFzdTCKu4eE+E9ONZE0T9szc1IKeKf6/Vm0ipAd+nmE5+TrGbzZxk82PiZ4gVNH7QEvoc3gcT3FmQXFrMn6HVaPOOFDnN2+zwq4Y7oFxdSX4qOSc/9c1DpxkLQSfmhDaxOWSN+iQ3QCUJ6FPpB4=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BY5PR10MB4275.namprd10.prod.outlook.com (2603:10b6:a03:210::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 05:36:19 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8583.030; Tue, 1 Apr 2025
 05:36:19 +0000
Date: Tue, 1 Apr 2025 01:36:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] Add a cpuinfos BPF map
Message-ID: <Z+t7UAN7i+Dkpc5e@oracle.com>
References: <20250331214501.24126-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331214501.24126-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BY5PR10MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 81006bba-124f-4a4c-0575-08dd70df2101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t5i01Tu1nGL1Jmi0valewNiqTzJOoDezbZFinAPK6kaNgeYVRF2HScQUaMil?=
 =?us-ascii?Q?YJDrPy76sgg2JjhLqKr1Vmf1JG+DDBtlR0fYFXKkxbnQCJeeGVlN8BMkudTq?=
 =?us-ascii?Q?aCZ4dIvq2RFGao94nS5yz3n7E7//2qWYdKzQKILxs9ztEg2BwPmPzjHTTHHG?=
 =?us-ascii?Q?5G75xKfYkBLGuO9uUfVj2VnSY+pOvLybVxHOyYFtKxx/itR0RZ/pQc28yqqM?=
 =?us-ascii?Q?0+BsWAQuHp/vzFIw+7QDz5R3qwLbNbW7deNsiG5l6lqxpzwIkHHdPCjOpjIf?=
 =?us-ascii?Q?sMD/lLf5Dl6ujprVHAG9DCJ6OQ0xMhA3KKFooGpPFg8VzWh5GmIiYO1VENZh?=
 =?us-ascii?Q?jfgqfNik18MYhDxVazid9OqGoL61FW9MuzA1gBeOc488P5h/1Wsm1Q+NZkrq?=
 =?us-ascii?Q?tpYKD4ZHy0Y2cdaQj7EGPo9xcrhtnkOy3voL/0Yq12/yw+SUnYSKCbCtV+Wq?=
 =?us-ascii?Q?E2vV77+qanylpqFgPCQdfiqoiBCxFGAuCiNOEawvriHK0FGNDn3YpX2ayCBU?=
 =?us-ascii?Q?lroIzZ/LzwGtgW7rvv30jePjOaaMhsQwhziTeLPief/BbOWaYnBOOLul8eb7?=
 =?us-ascii?Q?u4tGAwNCyc6L7FVSZ2eoYpub42a8UFDNposhzP05tnOK6ODUOKfYYeFyLEY7?=
 =?us-ascii?Q?gw6/VAfa266krqt2zRSUMwDXSKqtpoEm5262e7Digh0kigw2QKkkbkVOpzS1?=
 =?us-ascii?Q?11ot9unCU2+ys2raO38l5KQPFIRiWeFilfwsGliEyFMbkN/n//SW9Dp4Lidq?=
 =?us-ascii?Q?fEBDHCDDw4+03HRtrt+XGsl2nnnR2icSbWl8sc5ftXoINqx+B1633572hEkH?=
 =?us-ascii?Q?NfHAPTs2IWt83uYQKmMKzZaITOSfhtRR3N/JD5fMcUlo44aaFd9r23SQGLZw?=
 =?us-ascii?Q?dE1El8jwzsYURdY9GoQKIyRoX14PQrllgT4ZxmoblS0gPbzyYg2bdhiViYIz?=
 =?us-ascii?Q?WACB5d/Q9VdCT47vhIV5RWSlw+aZEmsQyYj6aEt4Bt0Zd/mKj3qC+Tbo2ZSC?=
 =?us-ascii?Q?E/zfaMyQpwkE7DwLde7xeqgFGfdodfMTt0fvSEhPScfqPNaN25UpC/+vP2Y7?=
 =?us-ascii?Q?cOMCAiB7m3EkT5ZPFluA3DdRddM0M0I6zWx+eNJDKyN6F4+Ni/kF7O1BO/z+?=
 =?us-ascii?Q?0b6rRrlgdPY5Wnxo1TcopkbKbLBFRuRqRYHQXgZaU60mgjWYC7rEPiQ4VDpK?=
 =?us-ascii?Q?hXsHucATQLEjOwNiNlyqxSNHXXtsw2yuBeOkhZPYKVK4+CEWAeGV8x99ctHm?=
 =?us-ascii?Q?L+GBvDFDquG2347hE14lSt15dkn7krDooSJQjrAYVhUHm3Sp++Jn76xxl/55?=
 =?us-ascii?Q?BLZfVD8nid8Jk3/GQQPaKnC9uHnTlUw9ku1AGqYNL0C6Ce1oc/yP5EhpeCDU?=
 =?us-ascii?Q?jWPEScIc0yyqeC+SIz27bkLJTEo1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2tL2xkCc/sCboQiudMWvdLnkMxy3C9jKtxxd3TdrpKgj6HtJG1H/XOzL+lCT?=
 =?us-ascii?Q?Ht4GSEzNgfRdLedQpU4g7ComqABLMO8gYqNgsVuzYUcWQ24PfdqHG08Pnwy6?=
 =?us-ascii?Q?kWdJ8xkvr5RuRG3OTLydstiYsQFDezybLWe8lHbKZHawB/JABxN8UkhuqBlY?=
 =?us-ascii?Q?aLDhG7aIu1bRbm8pTXRrVp8TI9+Mq56qRw9IgpoLIgT5CiYRBuRpSDkHH30K?=
 =?us-ascii?Q?qFzgDv5Kl3zdVmXc57Wt236FUNRcbldr3f6+atKz8wcPv1djiq7QcVz6zJGr?=
 =?us-ascii?Q?Aj7P0JlU0AI6v9Zd5kwCTDmrjGx01BodkWzNiqpqmfvtRZH9NcV1LkPSmpXJ?=
 =?us-ascii?Q?isvDVVZfgnLYKLCnSSRMPd9SbIdtm7nFAxH0YMq+ZGIz4sW2vFz1kFUpw4WU?=
 =?us-ascii?Q?dv+F3xzdT/2en9WFBOr50+tNILf2LFcggZyxi3qjlZIssSc7xPdz7MFZBpu0?=
 =?us-ascii?Q?SFkVkL35bEoK9c4MSkpgFyX7ZE7wYfBep5gNS20OcfNGncrX5JDpI/vIDUlW?=
 =?us-ascii?Q?7BPK6Tq9SA+8hP+FDB/i0mF8GJUPTBqA6sk0Wg6QGVrhxPh4dR+C4V+0oGf3?=
 =?us-ascii?Q?CHwWRpr5wkcB0702Cr4vf2gb4F3sw/qM14TrQd/cdBSQSsTFaMfUT/tdHIt1?=
 =?us-ascii?Q?reJtvDUfxnZrpEZgUPTumLy4WprdNn6A/tcG313whqAl382hsGB0HNnT+vF4?=
 =?us-ascii?Q?ycCrU5Br89Im5O+xqfeAsKwtcx2iRNi7HKSdQTn4diMAuRBCfpJDLtXdQkcS?=
 =?us-ascii?Q?cfRu5AltLOKpudGaQkTVCdBFT23mRiHkhcMnIQVqBr4ujzlQnkqA2pnG2JvV?=
 =?us-ascii?Q?qGnKKeV+nhwqzSOtB0vskkq7TFUlyfByBsHlXKJTrCB6ZduJTmoKaVln2Qwn?=
 =?us-ascii?Q?YsjKXxr5lJHHACGFF7CquoFFFOCPu/tmX29W3hfEwFm06MLfOTWkaSBIfsxO?=
 =?us-ascii?Q?2QomMBIji4G5ntaaQd4fqT+lL6FaDandRdxCLH4jxxtCVfOhbCk07CXC+VNz?=
 =?us-ascii?Q?KHYKUdXdZSZNLgqq0GSj5/I0Kjph2f65yaBtdbaT40U/u/9xEj05twMOXz99?=
 =?us-ascii?Q?3N0OjIdw/+pibfSnZH0Ay3J0Fv3atkUEKumpsm/Xno+q9vSfLai78njhhW+V?=
 =?us-ascii?Q?WLFxv3v086A6qEaICblEZe+fhdXDLcJ5Bm1N4JnMI3cXg5pfJeOlUy5MjreM?=
 =?us-ascii?Q?AiwIhhLGjf1loQnzVwtZ64ofGwpVvEkIWU90xRzSNRU00PfC3gfVamQtkVZ8?=
 =?us-ascii?Q?xGEt06xfNKsexxo0EwlGRHlRqrsro7jvjDmLAsHvZCRapEI7aIHVw5fAzdNK?=
 =?us-ascii?Q?3PLSGni9U5DZ+V+L3aeLr0OXpxcVsWej0iiE4yGlU5juJrDJqTx4QAH2vaAG?=
 =?us-ascii?Q?vrGo5I3bZr6kMIlde54Ma0ven+QrrAgi8ZbgidaxqppKQjHvMnOD9c5j+6TQ?=
 =?us-ascii?Q?YHqYbyjkWj+ZTmDfCVW+oqoKgwvhHHjQ5kJUgxEndqL0gTAOZj3sZKVT1Cuy?=
 =?us-ascii?Q?XUH3oYy+rp0s+RXBKNZuaHxqkX0cYiHBhaPdg+T7kJmwnlMvcIbcD4tpkfKY?=
 =?us-ascii?Q?DQShyV9AAlVyHBRc5XQvX0cFF0WKUZNAGnBQZUm9QWW89g1SHyJP3vavJvcj?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0/XUG0XB5arCHRyqv/JFRn1MQ08w5/7JRq6hJh7cFTH6hNSzj1DZMxqJXrl4pmsc4aqyT6C21yql4wQU9Ay1ivZqjnmNmbmEINVWiSQsQRxspHJcsSaadrJu5BHzq0EgAu57h6aKl2i1PyOadgh939Aloka5P5Buxlvfsp3WPPKdOQaZpuVntBaiKvzPco1nGJN9TT509GRGIGh/K84g6jXAqiJ1pWggwWwOWMewqM1kT59m+VKPisku05ZsY4Nbz9hDb3OLEPg+QduQCKg8aEwtCDG7Pe+NafC+97CF60m5itnuRasiTyXsxoKXURTcqgGv3I8tl3dUyV+muzR94e1hLrKaioABF/KxpluAJ/9vEaNUfnWxwCXzzBtlX/bjBtsjAJEW1peItB6RvFfzO19GF550L0RVDbEVSNzZL8jwvnCOhzlRbUdUpTJKit02Bf5tedvvbk0F0+UlzYJYvhCgLs7BYjXuwoPML7ZTk9sXDW8kyn4NOVI3bm1Gh2xoDLrqEbU9qK7NzuXmYRD0sGZ584yyz2OuP5JpEyDi3Gxswu5KMo1gKlo6TiALSqPYfAFndMIQITHdENxL61PsW2wZz/o6Wvn4+526M6YhFu8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81006bba-124f-4a4c-0575-08dd70df2101
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:36:19.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChtOi8jvOYJnVmN+4FOkR1LX3RLk4pc6GmKgNz1rO5Z0dJSJaq5Xam+aNe+DPbxnM4QRsgCslnYGzafdd/Sl3Cy1A7Q98nlU1Dggx+NrZjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010036
X-Proofpoint-GUID: UlScnUK60x3Qn4_x-t-5XfBkrHYtX9pj
X-Proofpoint-ORIG-GUID: UlScnUK60x3Qn4_x-t-5XfBkrHYtX9pj

This is not the way to go about this.  If, in order to implement the cpuinfo_t
argument to sched probes, a regular BPF array map is needed so that cpuinfo
data can be accessed for any given CPU id, then the existing map should be
replaced with the new one, and its use updated to access the new one.  That
way you can also keep the name of the map, etc...

Introducing this new map with exactly the same data, and then hoping to
deprecate the old one later is making things more messy.

On Mon, Mar 31, 2025 at 05:45:00PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The cpuinfo BPF map is a per-CPU map that has CPU information
> on each CPU for that CPU.
> 
> Add a cpuinfos BPF map that allows any CPU to access information
> for any other CPU.
> 
> For now, we retain the older per-CPU map.  If desired, a future
> patch can migrate existing uses of the per-CPU map to the new
> map, decommissioning the old one.  This would include map set up:
> 
> *)  libdtrace/dt_dlibs.c:   DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
> 
> *)  libdtrace/dt_impl.h:    int dt_cpumap_fd;
> 
> *)  libdtrace/dt_bpf.c:     dtp->dt_cpumap_fd = ...
>     libdtrace/dt_bpf.c:     CREATE_MAP(cpuinfo)
> 
> and map use:
> 
> *)  bpf/get_agg.c
> *)  bpf/get_bvar.c
> *)  libdtrace/dt_cg.c
> *)  libdtrace/dt_prov_lockstat.c
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c   | 13 +++++++++++++
>  libdtrace/dt_dlibs.c |  1 +
>  libdtrace/dt_impl.h  |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 6d42a96c7..8da51d6b9 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -786,7 +786,20 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>  	if (dtp->dt_cpumap_fd == -1)
>  		return -1;
>  
> +	dtp->dt_cpusmap_fd = create_gmap(dtp, "cpuinfos",
> +					BPF_MAP_TYPE_HASH,
> +					sizeof(uint32_t),
> +					sizeof(dt_bpf_cpuinfo_t), ncpus);
> +	if (dtp->dt_cpusmap_fd == -1)
> +		return -1;
> +
>  	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
> +
> +	for (i = 0, ci = &conf->cpus[0]; i < ncpus && rc != -1; i++, ci++) {
> +		key = ci->cpu_id;
> +		rc = dt_bpf_map_update(dtp->dt_cpusmap_fd, &key, &data[ci->cpu_id]);
> +	}
> +
>  	dt_free(dtp, data);
>  	if (rc == -1)
>  		return dt_bpf_error(dtp,
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index 21df22a8a..0f19f3566 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -61,6 +61,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(agggen, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(buffers, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(cpuinfos, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(dvars, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(gvars, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 68fb8ec53..a5e42801c 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -390,6 +390,7 @@ struct dtrace_hdl {
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> +	int dt_cpusmap_fd;	/* file descriptor for the 'cpuinfos' BPF map */
>  	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
>  	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
