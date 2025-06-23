Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061022A1D4
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721849; cv=fail; b=AF5AC+P/IL6Qm+l18YDEhx6s0aJ1f7fPY4XIVNN63o5KM/+iVXJdmYtZ6uXDi7dZOF82+7i+ovsmL4JwxLcQ6FqvfSbLBP3w8Bnqi80JbTy1IATo0IofmRAoQ1AeOIrNw78DW0zkfCoIiRH1Cp60EprBTJOU+h1seytAbBpNNl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721849; c=relaxed/simple;
	bh=3K5zdrMXDeY5Lp+ZhqILs1YvbYz/ZqHnxpIgS06TB60=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Zg7faa24NwUaouFHRmjXq92xAtHvsdu8NiwvrFLqGHEJmpfXZEPelZ8rdizGD4VK+Pz3P4m6WiaZiEVDwE8xwtmzCDdoW+rJVSQIXVJHVrqBBu45JgsHJntxLcroWOkSdDUDxuaN/Z1weRTh6Com64ajeI2g7zelAg7lOmK6II8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LSaOF8J5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JhiT0lDE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LSaOF8J5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JhiT0lDE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NLfgO8030700
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=KGRL4Cx0mse1uIh9YCv4wpk7vgS4cMhyOb10YvRCitE=; b=
	LSaOF8J5m7jS5sNqEULYbYZxbh8tS7fFV82pbUUcARaS6ATSzl4c6yg3xslPCXGQ
	23RED9tV5P8pbvpZoYHaQ1FGJIPyaeTiAwAIQrzb/FuzJBfphOhIyhNhypq/hV43
	QVIz8Y822YfYTHzzULDn/GDQ+BE6AkehW2PZTI+t+S9fi3JWA2zdlaGWkKx/NI/e
	C2I3kGIfSM1eIfl3J3AQ3zsSX9pBg/QWP5EnpIgMbp76CHDyLJQTL2B2Tk+QLvyO
	BFis3pxFnySsxJZJfsrXaPV3mfWz4izlandWdfDhQUk0ipgvquJHQQlMH+syhT2+
	SOIVEbBoWDA2ZAltFseZEg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8muvx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NLC0ND031951
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehppf2p1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRUj1vhAJU7tiwQFjLikU7EY9V3l06MOTagHbWv5MbB306cplzpRO3xqQriGoY+d7uNI0N1hBqhGizC6P3/Wv1Mmw4YPepvLRoAcB9A+ajUogA1Jol0X29b599DnfSgEZ44SE4SA1n6yvAI9ifP5IqMlRH1UZd4Mf1kBpxbOkhialP+7HSUnpC5AGdiiXwl7AqJ6q46MgfWr8PnhMxXaD713EvY/eYyYjiZXPo/ATHcZQ3O04GiRwO2iV65IQdjKNo0Uu379Ktm+Zbp5WMq0YuE+KuW168eFcc7MQHoARfe7D77EWwK1TXdqJb0oJgXfta/jHFuSUfVfkdemhxneZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGRL4Cx0mse1uIh9YCv4wpk7vgS4cMhyOb10YvRCitE=;
 b=ZwbjgnKkru6+6JDn+GoQaDVd2yYw1dF+Lpy1UQaePX5uzk/HAnRRTRa3Qn56PVYyocMFfdgtQG5NQIEO4yvZR7swOh2vwMYm24LT+69MlFEDGn0CI/C6xxtgGtb6YJcD4d8HSYagr5VtEfBdp7y+tFwLzeamFkklzTgy2i5pqJWxwLtpwdbbxUJsQIBysi6kL0njtWrfM6cVjIC9JBa+a/nRtMGXwWQcm53+I0fK3O+YGJ4haa1HpgjR0Qf374OWpy9CBE81Y0kk0WyilCq1Qn/dgJOS7AYtd1xOXvMmmV41DUD1ceKrmTpsI7tWREMX4n28pQJuZmhW4J1yFWPzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGRL4Cx0mse1uIh9YCv4wpk7vgS4cMhyOb10YvRCitE=;
 b=JhiT0lDEGrWkqAfYaK2KKq8qyjFMYoDTRzmLtlAL/TZhE433TCJNv1Q4m0GChq+gfBcsRA7lQQ4MbBYcVN/v7AMDlocgsnoRilNRv5AY8TUdZi+9jf6aW6RpQzNnAwH2RsEF+krUuR3lLt2QzaL8r4J5rMaev5ugzGcTK5QeHQ8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4872.namprd10.prod.outlook.com (2603:10b6:408:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 23:37:21 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:37:21 +0000
Date: Mon, 23 Jun 2025 19:37:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] btf: do not try to generate CTF data if there is no BTF
 data
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56728D3C877CA67B4504822AC279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2c8d24-b49d-4eb8-ee32-08ddb2aee604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?K8PqwhRF52MnHKWMn9G1s4t1893eRhQuTBip1zGwUO9Z4sKmU/YdUnSohqFt?=
 =?us-ascii?Q?RFbzFBhWBzMEQepU0Iw0z1qfGFo00fBCrlUbVkIf5ZrlkYcASM+BU26w0cLU?=
 =?us-ascii?Q?5k1E2amxawqtvhbs6vjjflTsn5M5FzF+MwfUno1YMAmy9nhcRWTRY/t5wa9h?=
 =?us-ascii?Q?m0Ec7aeb8jMiBSk+IC/8kgfrRvEB3K3TazfqPtnW1HWFyKtDUKjHd8geE2La?=
 =?us-ascii?Q?yr4hAwZATTG3svrF3cVwcHh8xD1gHiVnyGsgU47W3ZzmIMsWKYePb5WfupNU?=
 =?us-ascii?Q?B+Yf1DIsz1Rm8xw2dHTx8lxXmFpMpLDJEndxHvY4X76hRumn/z9alf3oU5AD?=
 =?us-ascii?Q?w1w/ItaPuTtZLviA2uDe4yJlhUMjzaDLsB/klyVFZesca7IDWTNGwDrUn27e?=
 =?us-ascii?Q?DNsG23znQOn4O/c7QyJn7QvgWcfUD0fJUNvCM7CLSmKR01zrUvUZiQlzYNvh?=
 =?us-ascii?Q?RdTouufp8tqGK+KbVfPP3IoZUdGDGtE4rDsZ8EgEXedZ5rpH7rMqNd/NfVQe?=
 =?us-ascii?Q?Vv05BXtMeNLOMdkxQQ1Kl5Ns5uiAu7NHozTNUmHwNQtMs+5dFdGC08K0CjmH?=
 =?us-ascii?Q?1KVjFQTbcj4amDa4SMQOWZCap1cvwQFyihypcHahe+YqJikHMg9pn0LXZIkv?=
 =?us-ascii?Q?7sPyjt9MSYiJEKwRNc7Vjvx0hgf8ad4R37yNWtiS2b9cOROmHwV6bB3RuCmh?=
 =?us-ascii?Q?epaGdnFhP8JJLrujrWDanh5fOdBgrtCjGHU2cUTfyyeH4fAcKUY6udIGxUao?=
 =?us-ascii?Q?CzWRwHuekCc+eQxp7R5eozGIXeeCv9tMmVsBrioRroi7Xgll6z7Tm/KP6Pnd?=
 =?us-ascii?Q?ScFLqrOszGiKdu/iZ22CmMGEK3Vb63Elzx7GMAgDfmf4vKyAmx4ExBGFNVWO?=
 =?us-ascii?Q?oJcZXW4P3kRldbbk3Tmj7aecY+2Gk1KRsY11dQDLGK3Ea2E/JsbXAFqEqjqe?=
 =?us-ascii?Q?c85Sih9Dyq5+NModo2xxwux8SxAkDnyiG/xlZaIRFRm318Ab3mKJvZO/jcRT?=
 =?us-ascii?Q?Eo36vvkoTabbuUyJDG2bkCcHBMtGTFRHYUPO7TKcppwuiLSR6craNhFaeQfj?=
 =?us-ascii?Q?Yj4y17WC2zYdVKhE+YotTtuXdXMZTbZufoPx8z8kY6dXiB+bYvs8LIMBne9G?=
 =?us-ascii?Q?9yhrZrG3VJMUv6DhybHTraVI3VgmkydpplfadOg5DJuNpqo6/todUAUy1uYE?=
 =?us-ascii?Q?uP4Mmqv7q6X6KNTImonBcJqB/Mgd4vltoPxXk6PCr8L49JWYFmKKh2bi0h9C?=
 =?us-ascii?Q?XnW0WQ1wvISROF3n3EVxpOs7FG1wXQcqCkjNTVZhps3o5kf4EGz9ltwHr17e?=
 =?us-ascii?Q?PZoDX9q9W/Gxkk7vQRpVHUZk7vSCNS6Nmmk3UxmdbsIAXo3aQvTr2w0087Iv?=
 =?us-ascii?Q?jRPHjqWQJd+nluA/R1WF1M2SmqEZBSrJm7RFGFV8WyN+WEXtgw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?vY69Rq1O7GtyL21wrO5ucifRsFDUECsncOibZX0RV9Tcm2s/nny+A4wXjD7J?=
 =?us-ascii?Q?Gi/1AGuH9CoktGVcJ28HzuCneh23ti0Nd9pTVuV8at51/kt7puKmpAe0Nnwy?=
 =?us-ascii?Q?1SuEySbIehh8MQMOuUwYHh4E/IydadmvO9MleA5BExslJbQDJgSMuF6RIlGP?=
 =?us-ascii?Q?iG9dQpZkpzS+Hs2S5vYxPan1G5p+T8onEaF2dbmwY07DjtlYjJj54egOdtrR?=
 =?us-ascii?Q?oH1azdTe9IWHeQTRTuEwDDEr0MdyQm6E+rYEgDdImhRd472CKBXm+XaonAcY?=
 =?us-ascii?Q?rbVqZrJNZT6vsB2v6vG+26jOUZonZnqQJNZlZu9j5Oa0Z0agCNLG9/oOc6ej?=
 =?us-ascii?Q?ngSQPQIgrmPLY4WGNDX5UjguGT2YWLx3KBbC3ikz2vyJZaayQsgDHoy2ZUbO?=
 =?us-ascii?Q?8gMxkUXaxaS0iRZtsUXPv6QeYyQpYGujd+d74Nt2oObjoS5KPydihuIOgvVZ?=
 =?us-ascii?Q?VuGK7C5wFxZr0sNEXrZi2nHd8Vyf2bsPYIXI0DqmgE6UYdBWK1++LzMrOXx3?=
 =?us-ascii?Q?fiJND5ki3h1EwcY47nSC2wlqtsz8veDMyWgV8htuXe7FbJv9lk1lxRkQmDKU?=
 =?us-ascii?Q?7h1MIJNuZ7s+Tf3pFw2BMjq1B0cVlhsoQCQUYJIX91ZXCgSPDY0Kw098Kb80?=
 =?us-ascii?Q?fUSA4j8C3kc3f8uf5kOTIrNeNDeRbeDf5YM9ToiunkDhTYa4qyWrTivGPK64?=
 =?us-ascii?Q?+uaG7aSWTjVAbSaldsHLEKpZQbIOwFwcfqEU4VlS2ne3GvnOGqlQ3T/0j8pu?=
 =?us-ascii?Q?RT17xnPl0AZ19SvXEYAuSWBl3GzeKZgnHXkE406eWz+P+c3vCx56wRj+y+Ar?=
 =?us-ascii?Q?ngh9+qndsL4QHDF6MAl4ora3DOrEOeNWVTKY95YXhMaUFff0t0vnD/a7UVwg?=
 =?us-ascii?Q?GkITVg1+LDGtUeRUny1uW12Dn7j5myW50yQqJnQBF196P5bLBXqofyXBiWku?=
 =?us-ascii?Q?0+m4uZn6jyYQKodCdQS7gEC0itfh4BkCdDq5iAnuTEGXIVpCLym126aRQrxp?=
 =?us-ascii?Q?06osHmoGJGhXcH5fI9xnHbq/YQ9FU7cHBuARvTCQO5KkGdxWyZia3hi3ZZxI?=
 =?us-ascii?Q?pQ4bBjZR2oY4Pi0CIs7TVBbtYuZApsi/fwpUd2+efpJ85UbflE1HMCF3IwAP?=
 =?us-ascii?Q?bJtE1oNdkSIGbY5JSRJEIO4UTmxGTZgoq0jwPuIFpnNQnDA197AFIRXdKJ8k?=
 =?us-ascii?Q?I8HbPT1ZVCf3mM9OtpgWe3nDSkydorNtWAGtfhS4vdU6uPGlAEiJmXjMYWuS?=
 =?us-ascii?Q?s0bvTYunW7R7OFKx6j/3cgtpkOzAG6Xf52Jfkn8/5gGidMifMszKoaEqLky8?=
 =?us-ascii?Q?i6tuXIn8N/MoWcZEWYuQM9Tnal6I5B8Kxg3P7ixYehTtprQplv0Egk2Ye9X3?=
 =?us-ascii?Q?lNupV2bLMaZi5nO3Icc2WxQrEfmiq8tTiAWUGNW1sZ44re8R9tYneVxzHRc+?=
 =?us-ascii?Q?z0RuxfmyyRtZggsnj0cF3pMkKbxDHa2kgKz8Ry/OXpiRvsOux1LbapjZucXs?=
 =?us-ascii?Q?p5zjGx2St9qdCrm72J7jYj2LphRwEnl/z6Qa9L1tpII2JpZMApkZbYi1hJ72?=
 =?us-ascii?Q?3gpjMcjhUH96cCU5RLLshB/sWAR0P1wqm8ISzEBisNg/AnCieBoA3YRypT2I?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 2bSzs3blNaHM6O60blqQK2LzVnGkvQM3FcLgB3c/pdNzd3cJlvHMJblOwogTlcPHcpYL8pm/lnsSMPIBqA8FNEVzYsZuxQZU9gI+0Qlb602lrXQa0dHoN9jwsZNK8gCqS/sLnOFrGkOcDtse+6IA51kKrRj9emuYPEblcyUTXvU2wr3BUOuwDh5qXw8uGLfjg0TYrc/8OkZtTuXra4DNhTc0jOu47S5DwbR3DcG+ne+7ZvZ25YLtF1T94X7gIHMOfStJMDByjJhvMmy1l5Q+TNsp7MvU32O+iJXxP2i4tnzoFc0OtvEebxLY2HdxqjK8jSIC6Q1QCOrO/aFwX453Eg4Vf4+SjDYRsSEkdE2zDs2HCt5yqlmlYS40lyrohDZT+Z7Opv4pyHg31jzEeFscaZBw90RqYHAaX9hL3ozoz3e4ZPvGynBBigNhe2KxVGiX3g6kbTh1l5L1+Ttf3zLq/lI5cItioi5HNQZe+hUUW504mxjIEKL1szj1o3BKwc5PaymbV4Y2hWFoOokyut7ObrPGAICtT+xm3iWD4kuGCkz0q+eSBhf42H1XhYSL6fja4W4T9s25uw8UXSGtfruq/GURlAMeVQzeg14NLBjRJBw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2c8d24-b49d-4eb8-ee32-08ddb2aee604
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:37:21.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T7yWDEYbTozaNU29JS3nKqNb5PtpyXP5u2Da6ecubjzeT8uzmT7JMAyXXYYXPpvnrB2bDpIAhl6UKh4yB/TCR43IRadnqDSIjYJeV/jbqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230163
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=6859e536 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d02rggM92VoNQGpC:21 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NqfIUXJLxrpI8vzxxdMA:9
X-Proofpoint-ORIG-GUID: aPS9OtNEyRBnquY3yUcYnhKLNlgNld1R
X-Proofpoint-GUID: aPS9OtNEyRBnquY3yUcYnhKLNlgNld1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2NCBTYWx0ZWRfX6ZyDZHL7oyHu 2ZKu1nfl8BueyBZdXrL1dgD8Un23Ny6MdwuYtPRXjNcGVrOYsd3qSzOuHC7Y188vXtQxul1rj97 BJjGuY9nJALMYwmWOn/g1TNaUbZFeRnXAGoTTjJnVwZrjdyKIc7KJe6EPu66kW3G1PuRuVUEqJA
 6eyGHlOSo+CsaF4Aw2osmF9fk0Pyv5WpzNHLkVch8zQVaFRzY5R/ZYQT5xPCNlEdA2ibVLKJuAt UOARkGLVQJel27fgX0B5oHGfp8MEK6ckRWIe2OTgdVt7DgC/uZZnpckLLT6OWsZZ1j5/AQ+uWCt RW0+GpndOGmFtct3Wm6eyx0d+b2FlOHZj4HCeS8stzk6obMRVPWnOfCSA7Vpcw4mxEUv7GpO1mD
 Jjj4d7NPN1+vFiCujki9BXmoYkpLhMeSB81xGpQ8lpOl1aEK7jWLCybxBQliCTNiP2B8IdIF

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index b3c8e247..eef5386a 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -864,11 +864,12 @@ static void
 dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
 	/*
-	 * The first module for which we need to collect BTF data must be the
-	 * 'vmlinux' module.
+	 * If there is no shared BTF data, and we're trying to load BTF data
+	 * fir any module other than "vmlinux", we can conclude no module has
+	 * valid BTF data.
 	 */
-	if (dtp->dt_shared_btf == NULL)
-		assert(strcmp(dmp->dm_name, "vmlinux") == 0);
+	if (dtp->dt_shared_btf == NULL && strcmp(dmp->dm_name, "vmlinux") != 0)
+		return;
 
 	dt_dprintf("Loading BTF for module %s.\n", dmp->dm_name);
 
@@ -957,8 +958,12 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			 * data for shared_ctf from.
 			 */
 			mod = dt_module_lookup_by_name(dtp, "vmlinux");
-			dt_kern_module_ctf_from_btf(dtp, mod);
-			dtp->dt_shared_ctf = mod->dm_ctfp;
+			if (mod->dm_btf != NULL) {
+				dt_kern_module_ctf_from_btf(dtp, mod);
+				dtp->dt_shared_ctf = mod->dm_ctfp;
+			} else
+				dt_dprintf("No BTF data for vmlinux; "
+					   "looking for in-module CTF instead.\n");
 #else
 			dt_dprintf("Cannot open CTF archive %s: %s; "
 				   "looking for in-module CTF instead.\n",
@@ -1019,11 +1024,14 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
 		ctf_setspecific(dmp->dm_ctfp, dmp);
 #ifdef HAVE_LIBCTF
-	} else {
+	} else if (dmp->dm_btf != NULL) {
 		/* Generate CTF from BTF for the module. */
 		dt_kern_module_ctf_from_btf(dtp, dmp);
+	} else
+		dt_dprintf("No BTF data for %s; "
+			   "looking for in-module CTF instead.\n",
+			   dmp->dm_name);
 #endif
-	}
 
 	/*
 	 * No CTF archive, module not present in it, or module not loaded so
-- 
2.43.5

