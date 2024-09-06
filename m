Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546DF14883B
	for <dtrace@lists.linux.dev>; Fri,  6 Sep 2024 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725659038; cv=fail; b=ZuRrT7UFKRHT+JhyQdHxsk7Ppyw6dMYDiktk1yH3WB3rjzDDxtZQ0Px+V0pJmL5taP/w0dNW9tHrs/ZeuKOX7EYXMfS0QXz9A/uzPaZPUFAo2i48b3fy11VmWDISmupbYqFQcOrYm/5GqMFR/95kKKgaS+inv+C9S5AlsyTWuqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725659038; c=relaxed/simple;
	bh=bXBxFLL9cawEJwxNa33cUqqFlej2n+E2rFeF2wyhuD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aU+c4vPHoF3jNs1bzkcl7vDOpQ0E3+jJILg5ia5DPTwSnqF/nHXs+aS65FvJcVtvYYB3gYz+yaJ4NMiWUkBB38uQoRk0aX9QckSqqAJe4q1M8TuTJBhqthHuzXIdofrAryENUFcqvqFC6YKb70cbBHBdkI8ag0/XOWIof0Cq46U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FlSYJN6y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XKIQ8uxl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FlSYJN6y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XKIQ8uxl"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486KXaFs032437
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 21:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=+/avxghu6EbTcik
	OuvMujZ07hAHk90ce3vsSY/ABho4=; b=FlSYJN6ymv6hdSRpbsrcTI8DkbRVKaV
	95EO37SfjyhwaoQ4m2WbbuXtgTTkEy9ywUykT+0/xMiNBkeFShTzrtSvJHHpPC2j
	zwyruWRdK+ZNzxlewRxLVh4itrH0L8cmI2UJmUxRnlQis/pz7Zz+2XZa82K5YNJD
	kAjFeA5h9YFDypTb+TtWok4+nbniFfn5GpGYJ/sGeypTWNsKGuqO8nQ3irSyUGq+
	xFybuwy7mvzhAewDs1RUJvFkFf8gzi9pvXK8+zdYOtGnaTc3773OWHLXbeEfmf/w
	M7/9HtTaNbbVXmyIg7f63/XThTZEm+9k2mpeZYOWeWHcjKZPFnybu2w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwntmvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 21:43:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486K2F7D036933
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 21:43:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhygf3bp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 21:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRnoT5OO16KRI+iKLOZS4a3FWIbmF6/3r4cVtm3gO2exb2bD/dKStkCxk1f1f84FrEMTExaIoOxwCfvoctbcUX9p0DKRQuPmAEYAaT7jCnXLxMERriZBOgQIkRyJTYUUJFi+TushO3pS3Ft3ufhiLGo53ULkiW4zfFL/iBX2DzHifquzsidXe5wBAPyPO8rBU2dwgsobkfM9nKCJWbpJwxZqHF7sbWXT+wecBmj4bVpvnFh95POvgeKmndotOm8v5IYIbd0W890rPrkAFOwy8uFB4IQCFbtmTGURlM0OwjFohT2usxOuk9bzFY9vLGi7TL1/93u/vkpT8QEPAPvAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/avxghu6EbTcikOuvMujZ07hAHk90ce3vsSY/ABho4=;
 b=sU28A0rITmq5L5H8VOBLSgsnCPeatiAZQDSuD2I8rtUYHgEJjCyE8EOOESQj3NbZn/GXjqJXSq0EeQt9zJBKRCknE/6toR81shIepxF5M3ubIRN6d23/7OqiwHZw5JrZBSLMimnoyT5+9vOg5GU2ibKR2Bfd9Z/W0MeEf77sIEyM0RUV/b5h4pBkfp/kEBJkaJkXV92Utfjz5QaWUecszFs0bS9as/7xfKOoQtLuHvWvwABVIpTyLpOS6o3luILzFwruObZ0ikfWOb15jKj86qAq0kofnwGFV8GwKfxT63J97rjfODCCfvtZ3Aykj5gKV1YAO2EifZ8FdKLhN7gphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/avxghu6EbTcikOuvMujZ07hAHk90ce3vsSY/ABho4=;
 b=XKIQ8uxl6Fna+qZ7ND1vFnU2+jbS0K8lwz7CF5j8LsN2OBxcw/m6/Uuyu9q4UnkFK2qppmi2rGW3C7XUB2q5QrJOBB4v+1TfYHYha2MJ//pQj+60dVmo09LUshadHrX3xotZoCDf0ZUJApYmxDHcqJl+pkyOZ4ZzdjXjP93QUFs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH2PR10MB4391.namprd10.prod.outlook.com (2603:10b6:610:7d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.22; Fri, 6 Sep
 2024 21:43:39 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 21:43:39 +0000
Date: Fri, 6 Sep 2024 17:43:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 03/22] Action clear() should clear only one aggregation
Message-ID: <Ztt3iMlYWm702Qed@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH2PR10MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e6e393-7050-4efc-e819-08dccebcf80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y0lSWITZqO5p+/QV5we6fRx8k6awTk+YM6yeE33HYDenhUphgql2Lr2DbY+i?=
 =?us-ascii?Q?v9pQYHX4f9HgTtOE8AjJxp5oyKcTMyBVibrNuHu6NSSDs2GDtv11OQYGHNXV?=
 =?us-ascii?Q?WypgW2CAAxGbPq44vsYPDR6sOCiIxyNZX04rppI7XuT7/Jnt/L3FDzQsAZGV?=
 =?us-ascii?Q?l/iYMhdZmDtdr1dAy/ymdlF5E4GgrNnX4BmPiNAcSJSLhXQTeu4U5kQYXlim?=
 =?us-ascii?Q?KghvxMZdzUaKZ/ajSKrhKQoRYeHRDkECWCuOXMS4Ibjz+H32VKRgnu9HtkKZ?=
 =?us-ascii?Q?Mq+bTkhLzTmJSnHuluroXz63WUjbEeJ0RmHwAmsAMQ0bNrXbnArtrqumu98r?=
 =?us-ascii?Q?bl3R0ESjJp/84VKwqhEART4CsajbGsC4ZgLt7TQ1xmpGzy78VJVN3zNwTnw/?=
 =?us-ascii?Q?+dr1sBeryNTGVLxRRYUTO75+62jzC++XZ9A/7wy88s7AkO8clM8B3aGYT27i?=
 =?us-ascii?Q?doglbN/F8vOJSWcsyI0rQ38aajxxzfI/WGKC0U5xj4DUYveChO2W33cspeGD?=
 =?us-ascii?Q?HlJhSzdXwPOLnCnBAAs36dYaUPut0SS7sc0zljY2UrF39cPi35oedKIem79b?=
 =?us-ascii?Q?oD4CnV+oVJCP70iy3tjLzJox31d1pL2ClmlyoumS5GZ5DN3jjHxXy6HnND43?=
 =?us-ascii?Q?GYRWa7Gj5f6i/QKNPXcYYQ8nIFPRdftKpKQ8j9nqkb5GMKTZ0G+QqB3crErY?=
 =?us-ascii?Q?AF0P7hC0gwhTxoQgiYKjzwLBx3J7JKA6JK1Rhz4aboauNlQCZjHPxC3fdbdH?=
 =?us-ascii?Q?QqxEhkxH4/3WzfvAh5L5H2tJS6HajBkTVOJ997WHTgouY8V1siY5ez81V/Vg?=
 =?us-ascii?Q?4S5VNScDyXEPdcMbRViLLviEMNwXvMLvGGj9e62nq+b9hN0YUJrdip8t+Tgu?=
 =?us-ascii?Q?JUab77EwLCbgefeIryU9oIAONCBJ2U0DYQKE7vwsIMBmSvMh/8fpGUzPO19U?=
 =?us-ascii?Q?gr5kn9xHpH7bYgWVZFEh5if/uBY/7pdUiVC0PEY5FK02XX6bbge5UqW5UU+r?=
 =?us-ascii?Q?X9972DdojSRRYvlDR+XoUKT5b570zPPpkcmoCNAobT6B8v/gadFbv+svhMmJ?=
 =?us-ascii?Q?6EE+TrPbNKiKT57JdrXiO4hZDlvdA3gHz7GBx9Ue9fZ77K0meBTi/a4FYUhC?=
 =?us-ascii?Q?oYEdax/f2uFnAVaEUTSlBb75U41geDQe5YvdhkRHAQXeYHPqnGRZRRtuzrdy?=
 =?us-ascii?Q?zEHc3aklPulF5Ib8SVV2ohrbrV31/piVJef+CPrTReMqDb0XMs7woHTOYI3l?=
 =?us-ascii?Q?u9VGEBE0OkyfNjYGII/ebyAwICLzJ9XJTAXpEiN4fRC4R6jsVki9xq2wxahL?=
 =?us-ascii?Q?jGG65DK4KctAS5cRSpY8BdlMNt9PKFBpo4Bdyd3emE+vhIygO3rRartz2UOy?=
 =?us-ascii?Q?BFK9tQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u8HcG5YXKvBDyREkltV6bpdkDzbfuzwpM5lNxdQNgWHjrVoaBJcF9sqdY8Zq?=
 =?us-ascii?Q?kK2C4/89VKsCxs2+5+0d0qgrnbmZWKljDzBdenjk/S6T8cIYnKl6sjRyAT2C?=
 =?us-ascii?Q?SGkGUxbsU7p16qDg+eKNFVLcHEInqpAb2ze8cG5vMvCvJcgH5OpP8AfyzgCC?=
 =?us-ascii?Q?dz6BH2FMmJJS2f7t2sfFeGRHsTiJSnuDGuacjjmEsgbr7CrENhRs3u0CupkB?=
 =?us-ascii?Q?hdkM325WsNfcL+UyMJNphj4056xALzSs20U1YSQsrbuwGxxQ2ESo0o/mjEt8?=
 =?us-ascii?Q?oXXN/sffWuHS4EaOZibnRvmWB6E6GAD9R+3n9ikDCClpQJlne+VjOLjMWw6F?=
 =?us-ascii?Q?WUigJ6tdVlyOfUZ6qWYTbmuuZIyK0obeYX/NeWrWrdrbW/rrXP/zBzbdLn/p?=
 =?us-ascii?Q?Q7pUTL0SnTj0pNyXTmW0azeasKfaKHGV/NhWCm1KGFTSNJCqfeHrkoJz+Y5B?=
 =?us-ascii?Q?DMAESdygwOa3rH2anmfDVumpdv3kPSC3Czpgw3mAiBcEuymDuxc+HNIKvKQB?=
 =?us-ascii?Q?e+nt0npaj0BUg8QyKfq4s+5vXY4Ai9rCQhG+9/KZ9tq/yWN0Uub5dVwM5t99?=
 =?us-ascii?Q?TGzj989cKPRdhn+7nwAeNp5EgYRiDPztbBQANiXwRHNEzQPoocRjfACfuTXV?=
 =?us-ascii?Q?XdMmN6xkngDjONiZ5ADfmfXHtdRgvAkGmiZOxg2jVM/ARHazLPAdF8ovZMqt?=
 =?us-ascii?Q?+abEZRwHnzb3U5p71dwwC0XXPZ/3VV63OKsG5E7pEx31iKJQj7sdIupoKPUi?=
 =?us-ascii?Q?l/Pz4OPD5VZvxS0zDoW9QoEmVCjH8pv+nqHZRH2gTkUEf99k2t56vNDjZb8C?=
 =?us-ascii?Q?9nZhZCWY9AAP9MQ4Trsk1PJZBZYqRucSB4CY/T36src413g+uk9AGGrOUl2K?=
 =?us-ascii?Q?iLJSpSJhXIQfvvscFbSD01hx8/oV5hyB6QsjLJ5NK3qBUvtJ5K1Bwb42FbZd?=
 =?us-ascii?Q?lwjwUNZZV4YC0rt4cA7Ekan1O8HeqCL7f51h6ZIOzOaVkXl6VPddlLFSSPar?=
 =?us-ascii?Q?oi0vUO2Nl+dUb+z5uPHmlSVKd0NhTOeniI7WSsfqVVvqzM2QLGc3Y0Z6V658?=
 =?us-ascii?Q?BnX2ek2qesYesK5jhjC2pY6F0cI+7WczAsPyStwLHdzNnDWoNmJBSc6LcmFl?=
 =?us-ascii?Q?8zEu3O6ut23ux7TzfNSrJsv+xTuHaZBzD7JzeXVBOO4+YXJSkq+T0Oj4AFlp?=
 =?us-ascii?Q?01nixEwmkOBI3zIiz1S2uHCqm1MNC72CJ0UzocJXMCy852hJGftxuUQGo7IN?=
 =?us-ascii?Q?+XvJ9K1if8Qxi5W51R+xNMJyRdmGG6a6XwJNAXGb/igvp8Q8FmpMf4FhLIe4?=
 =?us-ascii?Q?xeKGZ5+pJTdU3M+7RweKeaeUKX3qpVERv3tmWSSZwCx9FweG+nAK+1IZOGN3?=
 =?us-ascii?Q?LS6YuedubxgFA0N0TAqDQgrAvd4w2+pH4wpYQ3IOgZc0FZxPaJkmkt8gFeXB?=
 =?us-ascii?Q?6rZvDk0RrTGBwu75/AC/ZFa8Pd3PsAxeTO6/sM2I78OgW0BdutRVrbOOSooC?=
 =?us-ascii?Q?F6xsLvdYZ18SC+v7nKeHks0E0qCDXLhdwPzCK64l7YxUNH9/LvjF7h5zNaW1?=
 =?us-ascii?Q?Fwm7Xtd3VV2byitYJxjKhLkvaCncSsNTo8yPrhaxO5mcd4FeFpJZmfvCsr4t?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2EZ1wISFLuxnD0VFYl/TL0AgMEQnfZt744SfYo5jTE97cFB9OuQ4f7d113dT1kudeWI9VicO9it+AvUcbLhd7m6njYT66fHqALLkgZ6T4mWfFRTCkiegqfBVuXz2z9yKDJfJ+8ffUUh0erlbYp83jOIM1MlkERuZDfddBcXQ5fk3daYePCYhx9owoWbx23E4ycfNufa5QcZDMt4/2TpXPCdo5BGXe+a0+Yu3hZZaWot2bBwHYWyeV1CqfuKF5B0PTdoXwVYZ+4iyJnA7csvEcWbBnSbvwdzeKhpGZNLQoabQNDRWeaz5HGoYbH/9jW9lYab+yVkumgeQJSw2WVoQ7iS+lu1UjsK5ZPka2DlROXULZoXWG37l+PnFZzVcYy0aH1ObbBlybQ9DEwB6ZX6pFL9FN4njEsN1nlFp/SoXqpqLHDmPOmDuu7i4HiUYABeuaaMFqTMePR8Akpp8pmhLgIcVd4Mr7CwIa28SP+OdJmNQa4S0t6n3u3eSzRw75MhYVE3CVETQ+NooyedkpMqHG05vgOe9YRrlpJ3ovA7wX6HFaDzPzIU0iyZVIr0oZRxAPiBasQTBwP7HYYdQYiN2GbYViB1xvdFb+28HWKRMMeU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e6e393-7050-4efc-e819-08dccebcf80e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:43:39.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBYGy4E0lY7pA8Y9p27d2ffqHfVASlkEu3qiUaZa1RTrNl+CXiaBMPmTTaE1b95FH+YvX4h3dltkrOnd2qxJPQGnn0Rle0Sg35ul2kN4TeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4391
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_07,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409060162
X-Proofpoint-GUID: SQ9nS9vBG_zwuVzhOCY4kY_uRJgK9QX0
X-Proofpoint-ORIG-GUID: SQ9nS9vBG_zwuVzhOCY4kY_uRJgK9QX0

On Thu, Aug 29, 2024 at 01:22:00AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In dt_clear(), we:
> 
> *)  extract an aggregation ID (dtrace_aggid_t)
> 
> *)  increment the gen counter for this aggregation ID
> 
> *)  clear the consumer copy of the aggregation, using:
> 
>       /* Also clear our own copy of the data, in case it gets printed. */
>       dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
> 
> However, this clears all the aggregations.  While the next snapshot of
> the aggregations will refresh our copies of the aggregations -- after all,
> dtrace_aggregate_snap() itself starts with a call to dtrace_aggregate_clear()
> -- if we print aggregations before the next snapshot, we would display an
> erroneously cleared aggregation.
> 
> Therefore, change dt_clear() to clear only those aggregations that
> correspond to the specified aggregation ID.
> 
> In order that only a specific aggregation ID can be cleared, we
> modify the last argument to dt_aggregate_clear_one() to be not
> simply the dtp, but a pointer to a struct that has both the dtp
> and the aggregation ID.  The previous "clear all" behavior can be
> specified with an aggregation ID of DTRACE_AGGVARIDNONE.
> 
> Though trunc() appears not to be similarly afflicted, add a test for
> it too.
> 
> Orabug: 36900180
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... though with minor comments/changes as listed below.

> ---
>  libdtrace/dt_aggregate.c           | 16 ++++++++++++---
>  libdtrace/dt_aggregate.h           |  5 +++++
>  libdtrace/dt_consume.c             |  4 +++-
>  test/unittest/aggs/tst.clear-one.d | 33 ++++++++++++++++++++++++++++++
>  test/unittest/aggs/tst.clear-one.r | 13 ++++++++++++
>  test/unittest/aggs/tst.trunc-one.d | 33 ++++++++++++++++++++++++++++++
>  test/unittest/aggs/tst.trunc-one.r | 10 +++++++++
>  7 files changed, 110 insertions(+), 4 deletions(-)
>  create mode 100644 test/unittest/aggs/tst.clear-one.d
>  create mode 100644 test/unittest/aggs/tst.clear-one.r
>  create mode 100644 test/unittest/aggs/tst.trunc-one.d
>  create mode 100644 test/unittest/aggs/tst.trunc-one.r
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 329b8ffa..8825739c 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -504,7 +504,9 @@ dt_aggregate_clear_one_percpu(const dtrace_aggdata_t *agd,
>  int
>  dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
>  {
> -	dtrace_hdl_t		*dtp = arg;
> +	dt_clear_arg_t		*dca = arg;
> +	dtrace_hdl_t		*dtp = dca->dtp;
> +	dtrace_aggid_t		aid = dca->aid;
>  	dtrace_aggdesc_t	*agg = agd->dtada_desc;
>  	dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
>  	int64_t			*vals = (int64_t *)
> @@ -512,6 +514,9 @@ dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
>  	uint64_t		agen;
>  	int			max_cpus = dtp->dt_conf.max_cpuid + 1;
>  
> +	if (aid != DTRACE_AGGVARIDNONE && aid != agg->dtagd_varid)
> +		return DTRACE_AGGWALK_NEXT;
> +
>  	/*
>  	 * We can pass the entire key because we know that the first uint32_t
>  	 * in the key is the aggregation ID we need.
> @@ -609,7 +614,9 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
>  		 */
>  		hgen = *(int64_t *)agd->dtada_data;
>  		if (dgen > hgen) {
> -			dt_aggregate_clear_one(agd, dtp);
> +			dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
> +
> +			dt_aggregate_clear_one(agd, &arg);
>  			hgen = *(int64_t *)agd->dtada_data;
>  		}
>  
> @@ -1859,10 +1866,13 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
>  	return 0;
>  }
>  
> +/* FIXME: dtrace_aggregate_clear() is called from only one site.  Should we inline it? */

Removing the FIXME.  Yes, it needs to remain as-is because it is part of the
libdtrace API.

>  void
>  dtrace_aggregate_clear(dtrace_hdl_t *dtp)
>  {
> -	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
> +	dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
> +
> +	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
>  }
>  
>  void
> diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
> index 4f8d09bf..0dc126e9 100644
> --- a/libdtrace/dt_aggregate.h
> +++ b/libdtrace/dt_aggregate.h
> @@ -12,6 +12,11 @@
>  extern "C" {
>  #endif
>  
> +typedef struct dt_clear_arg {
> +	dtrace_hdl_t	*dtp;
> +	dtrace_aggid_t	aid;
> +} dt_clear_arg_t;
> +
>  typedef struct dt_aggregate dt_aggregate_t;
>  
>  #define DT_AGGDATA_COUNTER	0
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 0e30ddbd..f2d5cb74 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1552,6 +1552,7 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
>  	dtrace_aggid_t	aid;
>  	uint64_t	gen;
>  	caddr_t		addr;
> +	dt_clear_arg_t	arg = { dtp, 0 };

0 -> DTRACE_AGGVARIDNONE

>  
>  	/* We have just one record: the aggregation ID. */
>  	addr = base + rec->dtrd_offset;
> @@ -1568,7 +1569,8 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
>  		return -1;
>  
>  	/* Also clear our own copy of the data, in case it gets printed. */
> -	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
> +	arg.aid = aid;
> +	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
>  
>  	return 0;
>  }
> diff --git a/test/unittest/aggs/tst.clear-one.d b/test/unittest/aggs/tst.clear-one.d
> new file mode 100644
> index 00000000..f96c2db0
> --- /dev/null
> +++ b/test/unittest/aggs/tst.clear-one.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Clearing one aggregation clears only that one.
> + *
> + * SECTION: Aggregations/Clearing aggregations
> + */
> +/* @@nosort */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	@a[1] = sum(100);
> +	@a[2] = sum( 20);
> +	@a[3] = sum(  3);
> +	@b[4] = sum(400);
> +	@b[5] = sum( 50);
> +	@b[6] = sum(  6);
> +	@c[7] = sum(700);
> +	@c[8] = sum( 80);
> +	@c[9] = sum(  9);
> +	clear(@b);
> +	printa(@a);
> +	printa(@b);
> +	printa(@c);
> +	exit(0);
> +}
> diff --git a/test/unittest/aggs/tst.clear-one.r b/test/unittest/aggs/tst.clear-one.r
> new file mode 100644
> index 00000000..101d173f
> --- /dev/null
> +++ b/test/unittest/aggs/tst.clear-one.r
> @@ -0,0 +1,13 @@
> +
> +        3                3
> +        2               20
> +        1              100
> +
> +        4                0
> +        5                0
> +        6                0
> +
> +        9                9
> +        8               80
> +        7              700
> +
> diff --git a/test/unittest/aggs/tst.trunc-one.d b/test/unittest/aggs/tst.trunc-one.d
> new file mode 100644
> index 00000000..0556bb34
> --- /dev/null
> +++ b/test/unittest/aggs/tst.trunc-one.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Truncating one aggregation truncates only that one.
> + *
> + * SECTION: Aggregations/Clearing aggregations
> + */
> +/* @@nosort */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	@a[1] = sum(100);
> +	@a[2] = sum( 20);
> +	@a[3] = sum(  3);
> +	@b[4] = sum(400);
> +	@b[5] = sum( 50);
> +	@b[6] = sum(  6);
> +	@c[7] = sum(700);
> +	@c[8] = sum( 80);
> +	@c[9] = sum(  9);
> +	trunc(@b);
> +	printa(@a);
> +	printa(@b);
> +	printa(@c);
> +	exit(0);
> +}
> diff --git a/test/unittest/aggs/tst.trunc-one.r b/test/unittest/aggs/tst.trunc-one.r
> new file mode 100644
> index 00000000..a611026d
> --- /dev/null
> +++ b/test/unittest/aggs/tst.trunc-one.r
> @@ -0,0 +1,10 @@
> +
> +        3                3
> +        2               20
> +        1              100
> +
> +
> +        9                9
> +        8               80
> +        7              700
> +
> -- 
> 2.43.5
> 
