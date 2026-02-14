Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475D1B7F4
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089055; cv=fail; b=HnmyFQwwOkWM9B7DmXDBO3I4e9xtwNApacuorWrty++pfhQ05qZdcjCvRvRI7xotDDfkQONj1iEg9qK0rY7EsMDpb6WsL62FRDCpM2fWKHi3+XnvkFmdpGkxWWcdl1G3EhlwkN+iBt38kdbsqcHadPha0aDrgVdWujwclwqzXX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089055; c=relaxed/simple;
	bh=J7Vz19mAodN2u51d4xAXt/uMqmKxZUxYkK90GDpNQBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DWFKw29EwIRwU/KrCJJ6oB04yyhydc+0zki1j1aitxEhqQV+ymsu4eqawV8mk9nS1oY4HUKc8hc/W/H0zEjeza8DlIItAukESrqmgiQ3meLNHfSyUw9Iy3GL4q21/NZsE5E0GDV0xM5rEANqXCYT7WbVygaVl8x9e2QRsxqKp+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p1jdGzEh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hy4NZdHu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p1jdGzEh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hy4NZdHu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EGs6nO1907530
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 17:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=K5RC84OSxeE1qMF3bQ
	GwvhMFXPmBtt/W6WMQOM8p/m0=; b=p1jdGzEh7sgcqSCsjMikEuqM2e87oEQDsI
	gHyyNFrbOTP/943rTwANvQQOB1Rb8RIXHo62pHg8ksMW68PcQyjRZRttQxJCW/ky
	3BcZcTYd4KmRiYrtDs3+1FppaBTReHZGr/5MPXYK6FKMNNadvZAjDfXUHs/5SfnA
	CSHCq/ZdDZJl9+r9dqetjjV6W9FFnz4xCh5j6FuX0DETBryxkEyUR/JYIKBDBGlq
	ENo9jjblhHP4auRI7bo1iniFn2ppL/PeGKtHdCbDH5XJ9GEGXHMSeA3LHhGgEE01
	xPoK88A6bKJsvUBtvZ9xq3MKzx/JBEEDK0M7mUVqbsck+zuljAeA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj4ar9b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 17:10:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61ED1C0f022981
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 17:10:50 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cafg6q5gw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 17:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gstRDq8UhTa5uYJbhsyq4GvuwoPeuJYB+tnjtYh2t3IL99XsdCGt0rfCxfynClKI29BtPWqLcGClgOHGQKwj60oTbWJKEwQIkI3nf1EiF+LRA4tJc6yRvTegpcI9gGqPou7ED+Bfp2OmUbznA/CstoSbBunaC2dALFN0YCenENxVBVF3oOLXoqEwnAAWGrmrzD8V2ZWgYEIxA/exLUIPkgyFamGYJS3whwdEW6SfVH4oUja9w0dpO6dUW8AqZOb/33kDZi2K0/rex3+GS3QJXVhDRpNXYhkj0JfXN1GmOGXf+MOOWumvGIRXhlDzJKXXgFgyTbj69qE45UFq6S/JgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5RC84OSxeE1qMF3bQGwvhMFXPmBtt/W6WMQOM8p/m0=;
 b=WVEwAMx/sy8ujYHIKlU2ll4o9WggYNlzglXdUrcslJ2p4hAWdUiGEcdGms+cmReVl/fnlJf+KlTdPJjlwGV/JSn54Y3ZCeMCJxVK6NE4qyh6Qj+AqhxHVTxZL7lol7gb6tSkqaaIN+BYTBcTCO9fqLTHpms9V/CcFFsk5yfGReVe2up6Oxg2YCgy9Qev+SezVRW+P1c7Vc3reCfnwj7Dta5gQlid8hUYPbEm0Bcf4d2TsKonTun627qAD0sv7GxXm8LMDrkrKiAuijJQDetkng+n+uSzCE2P83eGdMpsjNMfXhNni3mycwlM0T5pd4PJq8CE7lRUC3ztvyN7GjfZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5RC84OSxeE1qMF3bQGwvhMFXPmBtt/W6WMQOM8p/m0=;
 b=Hy4NZdHuggneeDfCTsdSn1/uGPI7+PtuySfS19w7I/hqpyo7kJTfOTZgsHcrhbEHbOT3XRq5fIC1ZBZQY1kXbbKhWOesZJIrlOJ0tvDmPOzWXWNYiR2uiu0jHx8neZQaSCs3w9rAXvCFmUhUOtCsei4/maS0MKmTwbuc9jgHyDA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6531.namprd10.prod.outlook.com (2603:10b6:510:202::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Sat, 14 Feb
 2026 17:10:46 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 17:10:46 +0000
Date: Sat, 14 Feb 2026 12:10:44 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v4] Add packaging configuration for Debian
Message-ID: <aZCslG55jVsbt59H@oracle.com>
References: <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <87tsvkn0ai.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsvkn0ai.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: eca312c5-9fdd-4061-d772-08de6bebfe82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NSQbTeW5eNewcdFB8r1+zJZNeDI1GFUQN6C87QRmW3Eku7SgBCk6fZNdozAq?=
 =?us-ascii?Q?MrQA1pxhXywcyDq8dj49pNAAufO03Jf6xAccGkosEnEJNQ6dQuLhCQOkKcWh?=
 =?us-ascii?Q?e6waEQUD1BjY8epPnD6ecSaT4Xg13piVqtggdTYUpx9niJuQRR93tm0+4UtM?=
 =?us-ascii?Q?jX110JNQhaB7Qtl0dJJ6fa9m0diBLW16AX1rAaukYxVrpeKREgCoypQYhv5U?=
 =?us-ascii?Q?NMysCYMoLQemskD5jC+7Sf7TNB1HCgiJOW2lHGrSK3ipwmL0ue16kXnafQPi?=
 =?us-ascii?Q?sx7hxUMaeBKesH0IUWiSRdeUj2TqQog/oOVCna7PXdxjv4x2+QleCE5FxDOu?=
 =?us-ascii?Q?Nklz0Y5o7/EmTLXa+IYoe03vd1qoCxCAlhePZPkjyAho6+ZFdIJfcYlvM+/3?=
 =?us-ascii?Q?mh1Mf61CleSx5zcIRRzxSJkM1rKZz3qqLa422302a80n2LgrdptQmo1dMjAi?=
 =?us-ascii?Q?NvYbDW3OU+XzGMfkpX4sgBHcuwz3lX60kTMKnWpmOe891D+FnnbfAqpaAoP8?=
 =?us-ascii?Q?apjNkDSmT5cO4R9I6b9cu/ryUSCbV+dnsg2UN1YEX/N2e1C4277MvouC1RNN?=
 =?us-ascii?Q?kxgEZ4EzW2UVHlFOwwLRwovH9XuDr9hC9j2FM5+LA0xWKTYZjgKz5PrQIa/c?=
 =?us-ascii?Q?FzUE2OCKs4ySVgWUdhLAMUF7vfiJ70VaBW4lC4m7Pnah4bXE+y4f6CiBo0qp?=
 =?us-ascii?Q?e4ctcjROJq91EqKOvfgAByRXVCQZ4Gov8pEWKMOd4ek510H2p/XU8F8lLd+N?=
 =?us-ascii?Q?oNSoWA1i578v1HTgIXJRXN9ySOjPgjxbaZNW3mITwtq8ZwPI17Tz2+Wky/w8?=
 =?us-ascii?Q?UP1btGxOJWVmyE49eIbvfsbRhdcpkeiiLQgQRlr3k7YWo0L1J3UYXeZ0v4SA?=
 =?us-ascii?Q?APt0NuiKZuFsYFMN5nzJvTroCYtE7QW7+Aov9xfQ1zICi12mi1yvTmhsxnqz?=
 =?us-ascii?Q?ncSDZxoHwRf1cZ5pix1i29D1F+DEGMhbvIv2GSae8s7fHT/eHHJAxMsvaVew?=
 =?us-ascii?Q?M3EWmEt9vqw4ISWuYdNswaOFjdY5O5tOyZeh0QJjPUaCX1UP43djlaLVWUcQ?=
 =?us-ascii?Q?B4wRrj9htU3aBQVoa5SFTAlyZ+XTXj6XvJUTDyn6plzIxKNxD0Wt61ecloK2?=
 =?us-ascii?Q?mSOBumEcXzgkUHdUHjjadyJXUsplt6iCNMEClThfc8/397qq+Xyxz76v9Chf?=
 =?us-ascii?Q?mLJrE7mnyFXxKvHC0Ofe0gmczlLbHKREQH5VYuZYBjoxatyrJ8awm5CMBWi6?=
 =?us-ascii?Q?NGhcNYvehk8u1i9i9uT6qK5Khd9yEhwTflojj6anmPyeiZX1gntBICubZHWs?=
 =?us-ascii?Q?QM5zNORkV9pTgbiWbRLqVI71vXcy7/+K/RjqbDRhV8RuMcG9FoAKlceTt6RO?=
 =?us-ascii?Q?GsOOKy/03DftNsSoS9p5VVMFlhTmKy0wXGd+ACgAED68JlnzN+z5JQaBvVZB?=
 =?us-ascii?Q?VR0ifNBx1r5Vizk5J2hVA41mYZUD83HA/yuzSHnVnWieEwXseOEV7TlND0g9?=
 =?us-ascii?Q?nZvxkQM8j+ozJkUyuj6E98FJpznyp240CArg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NatobMtfQLvxrRZ2Xbifx5UvzzroKa/csYn5L55q/NxQLKW7jfCboWkuIjIE?=
 =?us-ascii?Q?DEG/GWUJb4TBoUXv5o2Je22xotrtRwbzj0XQJ9QMYaVQ+mjD1g3TYO7FZ7hG?=
 =?us-ascii?Q?CVX+uBRyL3+mi1KZQrJALs8uP5DarrczmHvR0keVAlRuW9+dDeQLylFQgKTb?=
 =?us-ascii?Q?gABdWuHCNsT7TJtoLLWHpEFfudRdEUVGNZP4kAAOHtem8/MwsxjkLm6b5aoz?=
 =?us-ascii?Q?t8Sb7DX6rnGfaGsSMcZeI/kWZZF02dk7QQSlZG44gBhK1Nu2jW6xTHKaEKZZ?=
 =?us-ascii?Q?ATJue7jw6vQHT4FWrl/7VsRCTVg0AHVcqKqFsT/7Em97/O3yA6/JYUSg5pJY?=
 =?us-ascii?Q?8NiqN6BOZfn7ojJtJSCjbPY8Olwrwon9xG6MX5gWwq8DJQa3SIP2qpGEMJ0V?=
 =?us-ascii?Q?CnOGmlv/Zhjyiew6vWggI9fTisC420rJcfE5IKMNzm+z7UdN/BmzkgKXJZA9?=
 =?us-ascii?Q?E2yMvfUnwsICuNqLqu3IJqMp4epmcHXDHjyTY3DF+JG0ewaadqCh+X0SK6gG?=
 =?us-ascii?Q?iMD9BjkpneEDVJ5kCr1DxAMC/I737IVlXtofzd74jGQ1ImSh5W/M8YwtXOsT?=
 =?us-ascii?Q?DUMHnsCpzbfv67vhjnuh1pQChnMt+UawneS3jddHGDmDKCb0eIyK6wuwU9R9?=
 =?us-ascii?Q?b788h1gLZQgjgmieBLSp9X6560jlmowby/O0nUhIIfQL2KDj3Ub2AfPS8VVZ?=
 =?us-ascii?Q?CL2p2sEzTlflHoJkX2cNeRWeUXDZ1cvkB5MahHaEq9E0FGvf5eSgto+CQRnE?=
 =?us-ascii?Q?biMa9PsfrnIDlihJyCQIEdzAvgDlUqhKsOycFjaH/LuwcYeIM4n62LJeEoKD?=
 =?us-ascii?Q?ZKjjzg4kezmaxJ/6z5A11WYcMgz4rRap4MpcBcgyi2XS83TLyNdNreJNnTQG?=
 =?us-ascii?Q?h+5br6VI+XlVggYoEB38on+VYlJahblobZDGaWAI7hgS/5xkUe9Ljy0qo+eg?=
 =?us-ascii?Q?EANuC3/KwMsgr7wqnleQ8X63UxhQGU1aFc9+3r5OtmSt2nPGI7uoBHA9azvn?=
 =?us-ascii?Q?1sJEzrXskT2L//0+XguH3rOajLR8qQjptfI11RxVDygslYCX8juFsqjd8ZvP?=
 =?us-ascii?Q?8QXkCxCuExGwFX5OOJmajwcqNuysvBVKjRDGbUxjhx2vYZWPfjndMbqf07oz?=
 =?us-ascii?Q?zJm6X8nqWX3drTij+9xS8iCEcK0M3TTnSFNj6Jnj3muOj9aCJ/OvNdWrjot4?=
 =?us-ascii?Q?DGNIzpKupO4LkYISJryJUA0sccTOgWNBc+nJLUH7nWdCxMurEBcBbmSMAOhV?=
 =?us-ascii?Q?yxYBM6LMxgh+cEgR2e9x3y9NNVOY3tJzsSTj4vWBMpAqcg/b+0mrZwhZhOKD?=
 =?us-ascii?Q?Gci9lJrVW4aHzcCidrxUuk/e31wC5k16iYtMy+9rwcdJtdYKXYJfL89FDuib?=
 =?us-ascii?Q?A2v+r+Ha47XCVwNg+oi3W+5jCCQvS9k1IHzDKm0yzi/ddLrFF4GkTuJp9Wax?=
 =?us-ascii?Q?ui9dMghPtvbs/UHr5NEndG9jx1k8/gcqYQXI7tjUjLPnvugp+ixYoRwGxE0m?=
 =?us-ascii?Q?GLOCAIuhjdlI0BU/8c+pqMZhSsHi3xSL0HVBxvYZ15Sfd43WQ4kE5LuhpMHo?=
 =?us-ascii?Q?l0aNmGGcxWBIclWZQCEdZ2Ky9pQMMWSkgpyeVe56M59Hq/rwME6tVoHsEcQO?=
 =?us-ascii?Q?vMHU2SN2hp2+Y7hq7jWmKT041e3HOIQebX2C5zRUwxvX6ZtYkRsgp1uIII8H?=
 =?us-ascii?Q?1OurnYOVu5NhBRN5bIa6/rzmMnrcxs5rCsigzgz4qZ7ehJFsotLm3WQ5ws9y?=
 =?us-ascii?Q?JlL738Drcw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5KzHk6IVf+RJLjhlirJwwCnv1l3NaT4pm0jPCMGGD4g896mdnMB1ZbTBCnvI894k9qq87U9J3FshibJLjVbBcNZwdmtVmqwqUz8Tr/OGh0kkVn7L9a1wWU4mqtSR5Iz9Uj3hGTt1g7PWtPPW2iQg4XI9SpSqc91Qa88eWXQ3rjNytRxV1mjLvS8NacgIecAIzs97NEWWVNpcf1yoAGCqoRa6x100SAiBEYTUcMLKU8sD5By6D5zyxG9uV6nwOK6To4IadA0sRuqYHcOzAceyfK5cOeu2f/CZoJ6m22pdQyu+uD4MwxDNgjoFxdA3xhHzuzTWBhD6dFkuf7PU3jNyAxxe/N490nJal1yJRjc9FQxuJ1s4FPU7SDdPvn34L4dBe7WoTflnW9xrkH+6y5iURr3svqzGAj4/Gk7tLYHUtdFWlG3MewfhSFRu1fx2uYG73kXOrub6W2sTC3mWa98SxI/sPrrduJS4QfokRA7I9XZouulxn4p0PxF/FIUBH8tqAZpZbjQkAIGGxKQi9SslrIe71S2gcwjjiFoOmR61ySNi84zhs5aD7KatG+lFtqZKkHE94w/M0l9PWbmksu0LtP9ba4QW900FHia4Qf6Bdcg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca312c5-9fdd-4061-d772-08de6bebfe82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 17:10:46.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOQUE2Yr4CG1cJomoMyXnkdv/MR5Y0WuMjy1e3ZjIsYx7MuUERfOUmmFN95shYIFUErRBGBk9LMFOcg69+o7MEJEXpFH7PZR00kdMlxlL8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_02,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602140142
X-Proofpoint-ORIG-GUID: jT_Px_OHqutfxBJy0h_shn7eWu8_RjuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDE0MiBTYWx0ZWRfX3Ekf6xzLEMnk
 I9SUKcqOIu/A6TKRB3jmmbGvt119XIlcVCdhKY2tDhBDye7WlBvDNM9X4bj75sgOpcHWX6XRuOA
 oe3UzBS6k+jI4ysaXEa+ZXQ2NL4Zc9M86XSkQ6aaLyP0zleZ0Vep3YgMTtj7yR9581ZAIH0Bsv0
 zy/9RIK+b9aQpy/vHdhLl0GI0dbat/8So1WiJxFJG47By5FasTUGwiPLgt0fQYvKCXb47AFBdrR
 9rxjpvM9rLyDNBt0xMNJwBe72yAR3tbauWxBt582VPSUObnwZpJ36DqHt3cJQ7ytxiConsuOVO6
 rIn7tcksYQbCNnp0JBmoYTeJAU4H0Txoy4Z9O+cF9DqaCkRNuxkYQ7IPdBsRHJ3HG3QlAvbsbL8
 YaBr1gXG8ouFMsx2EcRw/5bkHhokRMCu1hxufK92iLIYo5DEekWW9TKB+2/tFARA67oE1aTX8QQ
 yeXRRbYw7vVxd0W2wOg==
X-Authority-Analysis: v=2.4 cv=SI9PlevH c=1 sm=1 tr=0 ts=6990ac9b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=ze386MxoAAAA:8
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=Ixkok3qfAAAA:8 a=yPCof4ZbAAAA:8
 a=XZjG2xpX3Mkq0_UdzKoA:9 a=CjuIK1q_8ugA:10 a=iBZjaW-pnkserzjvUTHh:22
 a=_4Lj5ymMnAn2NA9aJKr1:22
X-Proofpoint-GUID: jT_Px_OHqutfxBJy0h_shn7eWu8_RjuZ

On Fri, Feb 13, 2026 at 03:14:13PM +0000, Nick Alcock wrote:
> On 10 Feb 2026, Kris Van Hees via DTrace-devel outgrape:
> 
> > Packaging configuration files for Debian are provided in dists/debian.
> 
> Nice! Seems to work, even on Debian stable (I was sure I'd need at least
> testing, but no!).
> 
> > Sample steps to build DEB packages:
> >
> >  - make dist
> >  - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
> 
> This...
> 
> >  - cd $D
> >  - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
> 
> ... seems rather duplicative with this. See below for a patch with a
> make prep-debuild target that does this for you.
> 
> >  - cd dtrace-x.y.z
> >  - make prep-debian
> >  - debuild
> 
> It is a bit annoying that you have to do a prep-debian before doing a
> build, because this prevents you doing a normal apt-src or any other
> large-scale build command unless you already have a source deb that this
> was done to. (The changelog generation is nice though!)
> 
> I would be inclined to use git-buildpackage here. See
> https://honk.sigxcpu.org/projects/git-buildpackage/manual-html/gbp.import.upstream-git.html
> 
> I tried for a minimal approach using the postexport hook, but alas gbp
> wants a debian/ directory before it'll even run that :( so for now this
> seems to be the best we can do.
> 
> Here's a tiny patch to let you avoid the make dist in favour of a simple
> 'make prep-debuild'. (I didn't fold it into make prep-debian because
> some package building tools, like apt-src, don't need the .orig.tar.bz2
> at all.)

The reason why I do not do this is because the steps I outline are to get to
the initial state of having the files necessary to build DTrace for Debian.
This is what needs to be done to go from the upstream dtrace git tree to what
is needed to e.g. be able to use apt-src.

We are a non-native Debian package, so there is some work needed to go from
the upstream tree to what Debian needs.  I don't want to automate too much of
it because it is certainly possible that the creation of the Debian package
files is going to be done in a place other than where the git clone is located.

E.g. I create the tarball (make dist) on a non-Debian system, and then do the
building on a very pristine Debian stable system to make sure that it ought to
work in a clean-room environment.
 
> 8<--------------------------------->8
> >From 472a6c863d06f8e419827842e0e455d8f13f6edd Mon Sep 17 00:00:00 2001
> From: Nick Alcock <nick.alcock@oracle.com>
> Date: Fri, 13 Feb 2026 14:29:05 +0000
> Subject: [PATCH] dists: add prep-debuild target
> 
> This does the creation of the .orig.tar.bz2 in the parent of
> the source tree for you.
> ---
>  dists/Build | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/dists/Build b/dists/Build
> index c75f933270fa3..f1ed1a4627176 100644
> --- a/dists/Build
> +++ b/dists/Build
> @@ -9,8 +9,14 @@ dists_DIR := $(current-dir)
>  # Prepare package building on Debian (copy ./dists/debian in ./debian, and
>  # generate the debian/changelog file.
>  
> -prep-debian::
> +prep-debian:: dist
>  	$(call describe-target,DIST-PREP,Debian)
>  	rm -rf debian
>  	cp -rp $(dists_DIR)/debian .
>  	debian/mkChangelog debian/control dtrace.spec > debian/changelog
> +
> +# Prepare for debuild, which needs a tarball to already be present.
> +# Many wrappers around debuild already do this for you.
> +
> +prep-debuild::
> +	mv dtrace-$(VERSION).tar.bz2 ../dtrace_$(VERSION).orig.tar.bz2
> -- 
> 2.47.3
> 8<--------------------------------->8
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> A couple of questions below.
> 
> > +prep-debian::
> > +	$(call describe-target,DIST-PREP,Debian)
> > +	rm -rf debian
> > +	cp -rp $(dists_DIR)/debian .
> > +	debian/mkChangelog debian/control dtrace.spec > debian/changelog
> 
> (I have a tiny patch for this.)
> 
> > diff --git a/dists/debian/control b/dists/debian/control
> > new file mode 100644
> > index 00000000..56687a82
> > --- /dev/null
> > +++ b/dists/debian/control
> > @@ -0,0 +1,74 @@
> > +Source: dtrace
> > +Section: utils
> > +Priority: optional
> > +Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
> > +Build-Depends: debhelper-compat (= 13),
> > + bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
> > + libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
> > + libpfm4-dev, libsystemd-dev, libz-dev
> > +Standards-Version: 4.5.1
> 
> Why 4.5.1? I guess it's what debhelper writes right now. (The current
> version of Debian Policy is 4.7.3. It looks to me like we're compatible
> with it.)

Can change it, but isn't it perhaps even better to be compatible with an
earlier version, especially if perhaps there is interest in backporting to
earlier Debian versions?

> > +Homepage: https://github.com/oracle/dtrace-utils/
> > +Rules-Requires-Root: no
> > +
> > +Package: dtrace
> > +Architecture: any
> > +Depends: ${misc:Depends}, ${shlibs:Depends}
> > +Description: Dynamic tracing for Linux (DTrace)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> 
> Full stop at end of sentence (and for all the others below.)

Will fix.

> > +Package: libdtrace2
> > +Architecture: any
> > +Depends: ${misc:Depends}, ${shlibs:Depends},
> > + fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> > +Description: Dynamic tracing for Linux (DTrace) (library)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> > + .
> > + This package contains the shared library.
> > +
> > +Package: libdtrace2-dev
> > +Architecture: any
> > +Depends: ${misc:Depends},
> > + libdtrace2 (= ${binary:Version})
> > +Description: Dynamic tracing for Linux (DTrace) (development)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> > + .
> > + This package contains the development files necessary to develop
> > + alternative implementations of the user interface for libdtrace, i.e.
> > + replacements for dtrace(1) itself.
> > +
> > +Package: dtrace-tests
> > +Architecture: any
> > +Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
> > + binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
> > +Description: Dynamic tracing for Linux (DTrace) (testsuite)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> > + .
> > + This package contains the testsuite.
> 
> (... up to here.)
> 
> > diff --git a/dists/debian/copyright b/dists/debian/copyright
> > new file mode 100644
> > index 00000000..1a5c8f64
> > --- /dev/null
> > +++ b/dists/debian/copyright
> > @@ -0,0 +1,103 @@
> > +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> > +Upstream-Name: dtrace
> > +Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
> > +Source: https://github.com/oracle/dtrace-utils/
> > +
> > +Files: *
> > +Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
> > +License: UPL-1.0
> > +
> > +Files: include/linux/bpf.h
> > +Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
> > +License: GPL-2 with Linux-syscall-note exception
> > +
> > +Files: include/linux/btf.h
> > +Copyright: Copyright (c) 2018 Facebook
> > +License: GPL-2 with Linux-syscall-note exception
> > +
> > +Files: include/sys/auxv.h include/sys/bitmap.h
> > +Copyright: copyright (c) 1984, 1986, 1987, 1988, 1989 at&t
> 
> AT&T, surely?

Huh, no idea how that ended up lowercase.  Fixing.

> > --- /dev/null
> > +++ b/dists/debian/libdtrace2-dev.install
> > @@ -0,0 +1,5 @@
> > +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
> > +usr/include/dtrace
> > +usr/include/dtrace.h
> > +usr/include/sys/dtrace.h
> > +usr/include/sys/dtrace_types.h
> > diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
> > new file mode 100644
> > index 00000000..36294de3
> > --- /dev/null
> > +++ b/dists/debian/libdtrace2.install
> > @@ -0,0 +1,12 @@
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
> > +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
> > +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
> > +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
> > +usr/lib/systemd/system/dtprobed.service
> > +usr/lib/systemd/system/dtrace-usdt.target
> > +usr/lib/systemd/system-preset/50-dtprobed.preset
> > +usr/lib/udev/rules.d/60-dtprobed.rules
> > +usr/sbin/dtprobed
> 
> I've always been worried that these lists would be hard to maintain.
> It's a shame we can't autogenerate them, though it's hard to imagine
> from what. Maybe in the future we should do like we did for the version
> numbers, and have a centralized list of files from which we can generate
> things like this *and* the install commands in the Build files.

I thought about generating them from the spec file but unfortunately, it is
distro-dependent.  Perhaps some smart logic could work here based on configs.

But I am not sure if it is worth it.  For now, this works.

> > +++ b/dists/debian/mkChangelog
> > @@ -0,0 +1,174 @@
> > +#!/usr/bin/awk -f
> > +
> > +#
> > +# This script can be used to convert the dtrace.spec into a Debian changelog
> > +# file.  It is intended to be invoked from the 'prep-debian' make target, but
> > +# it can be used manually as well:
> > +#	mkChangelog debian/control dtrace.spec > debian/changelog
> 
> This is really nifty!
> 
> > diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> > new file mode 100644
> > index 00000000..d4a89bb9
> > --- /dev/null
> > +++ b/dists/debian/patches/debian-configure.patch
> > @@ -0,0 +1,17 @@
> > +Description: issue a warning for unknown configure options
> > + The Debian build system specifies configure options that are not known to
> > + the DTrace configure script.  They should not cause the configure script
> > + to abort.
> > +--- dtrace-2.0.4.orig/configure
> > ++++ dtrace-2.0.4/configure
> > +@@ -172,8 +172,7 @@ for option in "$@"; do
> > +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> > +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> > +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> > +-        *) echo "Unknown option $option" >&2
> > +-           exit 1;;
> > ++        *) echo "Unknown option $option" >&2;;
> > +     esac
> > + done
> 
> I assumed you could just stuff an || true in there, but this is being
> invoked by dh_auto_configure, so that option isn't available (plus, of
> course, if there's an actual error other than unknown args, we don't
> want to fail).
> 
> Maybe we should just not exit with exitcode 1 on unknown configure
> options, only IIRC Gentoo actually wants us to. This may be the best we
> can do.

See my reply to Sam.  I do prefer to do the report-and-ignore option as I put
in this patch.  At least it tells us what is being passed that we do not care
about, so we can evaluate whether we should (or when things break).

> > diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
> > new file mode 100644
> > index 00000000..58bea538
> > --- /dev/null
> > +++ b/dists/debian/patches/debian-interpreter-paths.patch
> > @@ -0,0 +1,107 @@
> > +Description: fix interpreter paths in tests
> > + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
> 
> Honestly this one I think we should do upstream. I always thought that
> /bin/bash is universal and /usr/bin/bash less so.

Patch posted.

> > --- /dev/null
> > +++ b/dists/debian/rules
> > @@ -0,0 +1,24 @@
> > +#!/usr/bin/make -f
> > +# You must remove unused comment lines for the released package.
> > +export DH_VERBOSE = 1
> > +export DEB_BUILD_MAINT_OPTIONS = hardening=+all
> > +export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
> 
> I suppose without -Werror this is safe :)
> 
> -- 
> NULL && (void)
