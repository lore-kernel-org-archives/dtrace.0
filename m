Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5932AD20
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591804; cv=fail; b=mcMBYWqS3ncDHnsq2WATdoLjl5a8PQDtbfc0enpYMSLXh4VBRgUW9tHrrp9i9SZkuvs7jAbFGz0gRBJtORoo0RT8wFLPpkokypAAaAq7Lb2qd99qs51e4U0eYPTFFil/o6U+o8c+Ag1QCFkbDlO2Mi4fMltwdMMckpy1WAH+PZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591804; c=relaxed/simple;
	bh=YOzvuenYu9gpr1e8NeLp3LaNVHOYTBGtf9tClil+1DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q5lDXSTO1laVtD0sN/2P63NhWjv+t6pP47/H4RgNe/jHdY0CzTxJYgXAjVIVcTP8+RTNjEw0HXhLdRAx2V74YQmzQBuo2MNnx4oVnLbpIPVKMc3R8Eh07g3V/3rQi1VSIfFPh5V5DtrV7E+oOGE5X0HNU3nURhqiUtYHeDZg6y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gF0CkkQ9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r5YtaeLA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gF0CkkQ9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r5YtaeLA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZCOx009067
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TeywvSpPHW0pirvnSY
	mP9kTtgmBV0Q6M2e7jxUf14yM=; b=gF0CkkQ9zErP2fEURRUie/I5H0c5bi/BX3
	4v9BghxZLwxphslmh17hTV16I1znDIqDQOEJtxBEmzuH1wPnA0GUrSRqCLNpsP59
	yqh4oHWboaId8HqyiXRhoOJPTUm/8bvT6EQaV/3q2xVyDaVP7iwGPq/iY7X3MUpj
	vIeo8CIy6C876MbAv8BCy6Ggp0f5/oP8X7AmfQycgavO7Jefwq7p/S91JVBR/Qst
	ylateMhxdTDcmjOweamErEArg+d3MpuprXf6954gwp/miyWva8BvekYgWatD+Gj9
	+OSJJMKuMm4UgRQFX1ZJMHnWOPAXkeOe919OlKeAkPIJXIae31cQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4pt8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:03:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FE0E3M040663
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:03:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a3wj7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOpEc6ooLfH3c9kyMp0ojdmswEnOEK6IdMJ8D9ApVt6EcTLHmr3bCp2fj0vvKu/Sixnxnll2HmoP7bYAV4HbzINcu9gtfMb+qQHQ4R5wRCQR/Dk0vFU4MZFSjBan65ai/e28zthHqYCTBtRWC85gdyVOeCEXFN1r9MiMPZ70Jaj5wIdWZVQ4sNsJif2jDcA9vr84DuCwpBfL0FSt5+8ZvM0KoIfN8QzrtfFECaT0hJMCG+r5Mn6RIVR/7qA2njiesFes12fTs7QcPwHbO2PsWwP/p+6W99UUvFk/6f1g6KuZ8BArr2w9kc5/BdevH0pqSUhNQtTIeX79OEZmZCVL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeywvSpPHW0pirvnSYmP9kTtgmBV0Q6M2e7jxUf14yM=;
 b=M9shhTL+YwkTcuBUSqT8vkV/VeRrDi/9yInMIUHuvPBA8jf/63bOvdrolOJEh92YB9ZNWDc0NpSCvKNhWMIwgG0JUfvRxmWuKBW8VD3FwVigOkg1B3LzzU0EnXqDI9lfeu4Ftnaf21g9X+0FHqfnlvGX2YX79GUGtj+t+zSCbl0UDabN/NJxVa5rqYx/TGltYREw9uD0zfwDjUKtCLo2lGmCzNjuxtQjbBsGQbi3WC0goI3HtjbvtpgchSjw7Cv3RE9JzqETJC8A5Km8fMyI7U5aD9qhoWTqr8vHp6qDrGSJPjoHvS8YZJKtZjLo+xzLc5Y+sv4nf64PAz2BuFTcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeywvSpPHW0pirvnSYmP9kTtgmBV0Q6M2e7jxUf14yM=;
 b=r5YtaeLAuz/8fjpRAEDrl/1klU1dt1aeiw2rpdmcglW2/UZb1KRtnZXXz/B5vUoVcW9bv1sNPvees6HIDsBpCpEcdnNjFkaCKsp6gX88xJKnw2UfDwng5SbpHcKlKWdtWR5ZcbatzOExLtUKAE/+jJYssD856IU45lK3A5NIzKY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS4PPF66324196D.namprd10.prod.outlook.com (2603:10b6:f:fc00::d22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 15:03:08 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 15:03:08 +0000
Date: Tue, 15 Jul 2025 11:03:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/4] parser, cg: Implement the return()
 action
Message-ID: <aHZtqUUjv7Mcw1rG@oracle.com>
References: <SJ0PR10MB5672B1209A91191478708DBEC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87h5zdwxpx.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5zdwxpx.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS4PPF66324196D:EE_
X-MS-Office365-Filtering-Correlation-Id: 852a5a14-1045-4211-16c5-08ddc3b0b54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4h5LUpmFwCX6VYa7BiZAhKbk8bhinQhn5+G4F/a9/WKgw8mgqIXYgxRR3++r?=
 =?us-ascii?Q?yb7X/ZXlF7pebOavCjSIFxS1QJmh7ikiTosN/aUFRFlNQjDTP55jrMier0hI?=
 =?us-ascii?Q?3XHXf31USoDJf2kLSsp9LbYZaA4T5Hp62BR2ctAXwCt1uNZz8m1HcHwPKivY?=
 =?us-ascii?Q?oxjUi9gZ4bxxG2Ad3lKc0K9zkf+UZXtdtB0Sd7IC8gtQCUvIGvUgTDBfU9dW?=
 =?us-ascii?Q?i7vxfRdMj1PIt272gBc0UaXPwUE8P1wyPyFdISCjj7HOevIf/Raa/q6t1len?=
 =?us-ascii?Q?ZyAKdgrJu7gGzjir9XHZjQrR3v/LM/XenG2Plp7oHFzb3oqMVIrdbuQUfLxw?=
 =?us-ascii?Q?rS9EhltlMAWzK1f34o/zOBT7PT933ZPOw/ejfh9+YlYTnOREAsxwP6dUwtyD?=
 =?us-ascii?Q?VNH8oKrtznmUfgsbbu6JI+rrZt23NpkvY8aQ6zSGFsqmhjPuxIraHzKjcGSx?=
 =?us-ascii?Q?GEgyuItvADvG5ByCXfy02mH2OM3hApHSaxWKkuMHnDBH/+QU055abFg7EAfE?=
 =?us-ascii?Q?f70C41kbTftxaDogbAHima+jsN23J3rkmPn2W+Qwsxbwzy0UG8DH2HsT2p86?=
 =?us-ascii?Q?Sq+sR1PdRG2fx31i9GYTusIqwGGD5W64F+MJr22v4tZKs8+O1ioQ56VuMVwo?=
 =?us-ascii?Q?lDkl8bDSakOlqR2yDcuNdqnMeFhPk9Ihq6IMYpBtQk4piXgSpaIrLur0MK6/?=
 =?us-ascii?Q?dJGi2uHIMfrt36psBf5Nl1vqbbofQvOZ57oR5eJVC2gNNLaHsC8OZbIG9frW?=
 =?us-ascii?Q?cCHFY+kyE6qMfAKCYwNnXOq5jxlJ3QChllzKvLybxINY94RdoyiA9e6WIOje?=
 =?us-ascii?Q?g9o465Wzxm2JIDX6jJ+MzGEG5X2M24NskGH6pEuMsh37HbtOICTItSHv7Pwv?=
 =?us-ascii?Q?T3EWuVWDfJOx+weQBuasC3X/bHX1+ulwshKhGzOdccvESfpYLJEW0mg55q8V?=
 =?us-ascii?Q?dyzknRbAjArdfqQryQzr5WZgMgiNzeRvWl4nfwPxSvaObdVaOBSyuGCkQ5tS?=
 =?us-ascii?Q?aIxWoCV+BuC1GuXZ8V2F4rJzP15nDRA0OElc21bwqq+O0ESOvHIDILL6yoLq?=
 =?us-ascii?Q?KDPKhI5HuOpts0VnxJ3dK6pnmWuUT57WtDFjd+tBmOo8Y7nvJtl2yX7I996j?=
 =?us-ascii?Q?5qSZnKSgSmIpPOv25U0Tv/dLJ2xEmesCrl0trOPzz6cii2Z4vt+OzWM0e4tD?=
 =?us-ascii?Q?1hax5Fan8aCAcvThwtu969x6RKQUtuvKK/IB+m8GCfyfa/I5GJD7Pf+e3QKq?=
 =?us-ascii?Q?ctrfT5tio3HBjlGADOJrodVGE3+i/d0l3j3hlfzHNMJxtlimQK01gc84ThyI?=
 =?us-ascii?Q?Rs/Cc1pkJ0X3vpkoowUZyeC3mE0PQFoFdBXHbwBuNtulRN4QYuTMghLMBEDE?=
 =?us-ascii?Q?CfCXCgDrfsE/NcjfXy/IEmDidiYg5IN3bfFg5gNTqweccRwtpQ8qgiua7Wxp?=
 =?us-ascii?Q?Ek3ie6HxfJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5/AD5BVCSlhI28JYoHjJm3irrWCb5XGFwN2+8zygz7fSzk0S8mauvdBITVql?=
 =?us-ascii?Q?KBFfNPWWi7tLSAqf0C+FSjX4135pgCqxUEOXA8LltaXWb4DuiEIOZ9DovKVe?=
 =?us-ascii?Q?2vsSWk/43u2c23taWbTCoW2KTgZrgfrniAdxbJq/2NLowIRA1IJiEbHuSlFO?=
 =?us-ascii?Q?3tbPBow+UEuuHuwvB3YakHHWJAWKLxosQ83cJkQvhs0Bs0eFWBkOmpVs0KST?=
 =?us-ascii?Q?2w/mpaTff4ph9u/1VJygNzuGkwS0hVecLRrscuUHeSfyHxa2GHZoSC1ZCfM1?=
 =?us-ascii?Q?GuC9mt3EMP9QjSi5UEw8J47dpIeENKp8hqdmKNzZLnTptr8UaEv/TTkcfhy4?=
 =?us-ascii?Q?BC+f3F/n0vC6GDBhjAb2buk5b0ThkZQvw+k3NNN5WwqcL4ub0M3ESDhH0vd4?=
 =?us-ascii?Q?6NkUmZpSv40js3hj/30KSNPEcc0KZeRThk5sZvfUTprWlUSiUo8Qfnc9k8XF?=
 =?us-ascii?Q?vuNS4Z14fKS/2IBYLGj1Q3E3ZRYl3pFXEPuPFVBGK9fSwpquGXSxhinLW4Vb?=
 =?us-ascii?Q?sVvAwip6MaoQTHJlBd1mRpl2VyiKh2a38arURdE/ddlI+sFCPP5b69II26i0?=
 =?us-ascii?Q?mCV2uhBDoayXgRNC36hmpT2z7X/TW0VMXfu79/ZuG7Ghy0NaFvZO4AZqaeF6?=
 =?us-ascii?Q?NlQWWFQB1U3qyMHW+nybOMZwXHthRB8laYIPSdBL69nBMbFMpkOQeZWu8RPa?=
 =?us-ascii?Q?9EziDaKFJMNR1KdaA1YyWcWf2ZcJcX3mJSemff1UmuNW4c0sA0my7DJsxgwz?=
 =?us-ascii?Q?Tk55WgE2au6uDe5WEkzmMI+PeQCeLGPSXPAJvwETZvRCDJyfPczfEC3QxJJ5?=
 =?us-ascii?Q?rGAfPVloK2AELWmfYDsfsEYVxl7JSMp16whVTbSfxgzgCh41mB5cdZrP5R7z?=
 =?us-ascii?Q?Y0qzF3GoLagDuGr6ha9pH2wKIhUvEeW+nVl7JzaXiNQdWcYw/E2rYx/NpQsp?=
 =?us-ascii?Q?o1SMYPinsmDCLH1zJlSS7GEo7878QJUf2npvvBuGhmZkNfO0tHsr29H7kYQy?=
 =?us-ascii?Q?Gv/G2uGpX9OoPhDeOaQkQ5Jvyc5pJ2WL3G7ZWAlFuwCNkMFz+lkMw3eVm+3p?=
 =?us-ascii?Q?im6D0ikzG+7Nh/3xJqwqfUd296lGvg17DYsOMGwap9AfFU+E75IZubeQdZRO?=
 =?us-ascii?Q?dmcqUWJhyzI435otgliN1uBEu7E8OIclyf0ZhVZ5tmsNOZ8A9fK1MIpXfVsc?=
 =?us-ascii?Q?NPGg/3MEXePf3rT8VYPfo0Z06q0v1YOfKJAL8zCUj7Uqqot46etucHHYpXnl?=
 =?us-ascii?Q?7PwH7o0K73qSZDX/oU7G6rW5fsveyA+kugPQGi4CPgOW/Jvk09GTz10PrvjG?=
 =?us-ascii?Q?4PcoL//gIsc1A2B1B6IOQpZ2UIqYbx4qjvZ4BGOeN9CYKYMgjdx8Kkwsf0IF?=
 =?us-ascii?Q?6Qfl+6dNvbyfdmStpf+X/bMpGUXDz7WscSEEO7dabe3/ZouJulXGMvllF6yw?=
 =?us-ascii?Q?XEEf6m/iKI3o7PoN+lxfiMd3hyvkCCxeCg41O/x/3Hns00MzIwHcA2M7MDYq?=
 =?us-ascii?Q?9U1v6+UhT7nPygnOijS7ybm4SnMxl9jBl98m4O0CEKVavpTkI2FzKenXxJEH?=
 =?us-ascii?Q?3aqe14Gpgf8nztb1h+QJaBM6Jeuuohdyb/dcpED02odnUrBv9md2hrGapbvx?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xc9s3ASWt5uGai2XDz28L2jddrkIuHl1bW34C7Uxs5Gn7lB0RzIUWNqkEcAIOyDjoDF40zNTkmOtNj2D7fbNnwrrs8aPs8HT9YCiooDaJIOQO9bxnsWpHOpn6WwiEQ9PnMUSRVkJ8simG4ugiOIPyTlRcVFSvfxmbsS6TgEdLEegT4gr5vn6YpCr9Ay/M11Tf7NmbT+FOvyrJK5536JKexgQVj0L70z7/u9/Wo5Kj4bYWH2EwQrYcBb0RARicwc+tGsblvkl/h9JWeznepNLzFm3H32xdxLNkF73oF2UYLE13qejnUuZLfWmh+/7Jxp+BMzkOpxg+EruYLyx7ru6D04KS+Fy2VIFsHLiJSagq6ChcVonBJrLbEf9IGygPLY235kEQAbBWRYZXkuKaEIC9epTs7apEvijkp7+BLfqs04LnLH888zjrkLXhI2lsmR26qaS5PUI/aMeOPmqcIo9wFVMUz1W7Z5fjr0l2FQEEm5fb2eGyUfimLOxRmRqrPprZr56Vk4MVM9t/zE3hrqCd6MOUVbksF6lg0UtH/TqdfT3gQ4QeGWObHhSXd2gkDk73HqGXw47w0/v/A7v355s1yDPMyFxhQ5k4u/qJCPBjg0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852a5a14-1045-4211-16c5-08ddc3b0b54d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:03:08.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELlpjGi0M2lRp5IsYFnruvUuaEDEia+Ma+r8+cndhbV2JMuOVQn7ye+Bz+Nv7a0MkjdhwYrn4pCKbduA7AVDNOlX8ejIcgwmD3b6p84NBps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF66324196D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150137
X-Proofpoint-ORIG-GUID: 6AcabDync-L2Hhh_xmiVC-ujuXN3y2Wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOCBTYWx0ZWRfX5VfZQ8zlA6R7 Jb22Xsy05bQeZUX+qmbyxMXy32RIjGxdBNEidCaRQlrarmemi9205AsgF3hFZRIFxXm/vmCLbWE PljgVnLGe4tUCa3QvK1TBzZXjKYvpqI2v8V8blGdDcfcoaHpVX+bbHPypU/EgFNIWTWFDOdueqY
 FPrAQAe1nxECD74v3DaROcxw0naDxq2CIiZkfMTM0frgWgf3WGalTmvJahLEIziGzwQHriS8y7z uJvLyORbBfQGilww13QITaQzXU70T7bD5MCbKAONeEKCmFnmcPbwOcHF0383eWNpT9T5K/MMGup RHCZlh2obiiL4aoczbACxXYfyQoX4doAgg1H3jl9u1brSXGodkaqqL9yuKzLWUqBKxdO7bgtTL2
 O+gM3apODVxUKIxb4QzGd/V0xSYQj24xIfv0OOGftjT/4yhiN8f4zzhA3NzasFCQgAJq6LS7
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=68766db2 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Ss6G5KZV75dtqzxMO-UA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: 6AcabDync-L2Hhh_xmiVC-ujuXN3y2Wk

On Tue, Jul 15, 2025 at 11:32:42AM +0100, Nick Alcock wrote:
> On 15 Jul 2025, Kris Van Hees via DTrace-devel outgrape:
> 
> > The return(n) action can be used for error injection by forcing a
> > given return value for a kernel function.
> 
> I am amazed this is even possible! I can see all sorts of uses.
> 
> Presumably we need to tell people to turn on CONFIG_BPF_KPROBE_OVERRIDE
> somewhere... UEK already has it on, good. Not many functions
> covered... I suppose it'll let them trace a *few* functions, and if they
> use this they're probably used to hacking in more error-injection points
> anyway.

Well, it will be mentioned in the release notes of course, but the way it is
implemented, if the kernel is not configured to support it, there will not be
any functions for which it will be allowed (see the rest of the series).

I debated putting it in its own provider but that seemms less useful, even
though it would mean you can list which functions can support this.  That may
need to be something for the future if it is wanted - right now it is easy
enuogh for someone to look in /sys/kernel/debug/error_injection/list for that
info.  People using this feature are expected to really know what they are
doing :)

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> modulo the tiny nits below.
> 
> > diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> > index cc165c1e..bdcca415 100644
> > --- a/libdtrace/dt_lex.l
> > +++ b/libdtrace/dt_lex.l
> > @@ -104,7 +104,6 @@ if (yypcb->pcb_token != 0) {
> >  <S0>provider	return DT_KEY_PROVIDER;
> >  <S0>register	return DT_KEY_REGISTER;
> >  <S0>restrict	return DT_KEY_RESTRICT;
> > -<S0>return	return DT_KEY_RETURN;
> >  <S0>self	return DT_KEY_SELF;
> >  <S0>short	return DT_KEY_SHORT;
> >  <S0>signed	return DT_KEY_SIGNED;
> 
> I guess these are here for C/C++ header parsing :) a somewhat hopeful
> approach. I wonder if this change will cause breakage for non-bracketed
> returns in C code in static inlines... and returns of non-integral
> types, and just plain return... ugh. I suppose inlines barely work
> anyway and the right way to do that is to simply have the parser ignore
> static inlines in C headers anyway, not have it try to parse them :)

No, they are there as symbols reserved for future use.  So by removing return
here, we are putting that reserved symbol to use :)

> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index c67455e7..08394a11 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -269,6 +269,8 @@ static const dt_ident_t _dtrace_globals[] = {
> >  	&dt_idops_func, "void(int)" },
> >  { "rand", DT_IDENT_FUNC, 0, DIF_SUBR_RAND, DT_ATTR_STABCMN, DT_VERS_1_0,
> >  	&dt_idops_func, "int()" },
> > +{ "return", DT_IDENT_ACTFUNC, 0, DT_ACT_RETURN, DT_ATTR_STABCMN, DT_VERS_2_0,
> > +	&dt_idops_func, "void(int)" },
> 
> The "problem" (if this actually is a problem) is that this is not the C
> prototype, which is not expressible in C :(

Since return is being implemented as an action it needs to be void(int).  If
we were to implement it like its C counterpart, then it would be a language
construct, and in taht case I would expect it to somehow set a return value
for the clause. which doesn't work (clauses do not have return values), and
it would not accomplish what we need here.  Since you can never return from
a clause (perhaps if/when conditional expressions are implemented, we may
need to revisit this).

> > diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
> > new file mode 100644
> > index 00000000..97ed0762
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
> > @@ -0,0 +1,20 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The return() action takes exactly one argument.
> > + *
> > + * SECTION: Actions and Subroutines/return()
> > + */
> > +
> > +#pragma D option quiet
> > +
> > +BEGIN
> > +{
> > +	return();
> > +	exit(0);
> > +}
> 
> You might want to try a straight 'return;' as well :)

Sure.

> > diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
> > new file mode 100644
> > index 00000000..37ff4d9d
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 18: return( ) prototype mismatch: 2 args passed, 1 expected
> > diff --git a/test/unittest/actions/return/err.destructive.d b/test/unittest/actions/return/err.destructive.d
> > new file mode 100644
> > index 00000000..4c4a246a
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.destructive.d
> > @@ -0,0 +1,26 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: return() is allowed when destructive execution is allowed
> 
> return() is forbidden when destructive execution is not allowed.

Thanks.
