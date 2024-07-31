Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE241396
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452541; cv=fail; b=ljsjFttw+N70VqlOvSm2DXYHm3b4m4ZPSXbYrk4W99InprhCr6DwecMJhs7g2q5f+lh40dFp49nD0VN9H14BMFSMus6EVr3D8mj9mzufTDvececTA+jINgU6KXtegww2WBaSJ/LvShbk7VIi6v1Xvk3vRlSr7N13/sxNN9b4nEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452541; c=relaxed/simple;
	bh=ILys1Gtfz5aA3N2N6svXl3pOyLn1vJU4lg+jLYMm5tI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Er8XlDiMlCEHYNUmchM9wp4OT7WQUv1EfsHN4y1KxzVpLlu06gxMHKTnCyVY0fIkLQzEfoqfw3GWkkbU6mclYCGLRUj+/xB3HD4DqZCoQHNHioWnJmPScS8GurGTNgl2MEDeowkitUbUySgGISjae0MKcp6oVP8fEGmYbqofrmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DU6nUx0u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eyqfjasa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DU6nUx0u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eyqfjasa"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtURa013899
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=Qd/wwxBCq99LMngKmauaoObG5vEVCtMDj+lvklUTn7k=; b=
	DU6nUx0ukfIan7GqlLHcvEYVtmhF2RouQWt8z/0zZ02XkQPPGFwy1FyuF0FM3g7T
	0fuQYx2VTIMAx/GK6XTiDLUHGY83cF1JM2WVn7vYIABchfBVLr2my3HyRlNLKwkP
	DBo+uIdQGayiK5OZKhMuen5HP4ZvsFc/w9JIl8hoe7BSbKx1h3VwxTyiyoX99+Kp
	d8KQG+7hODi7xK/aK/mPypdcpviSIyUQOXrIjmd/X5bSG3yemiUD2Fje0dNkaBWe
	OqcPHxAC8hnhSdx5fF+HNjSu3XRWPUtXwQnMvmGt5OZWlt8POjpnUcOX5sDqCEa3
	wV2ZKyQ0864CObLlbWb6MA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrs8r1ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VHvg8h019030
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:17 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmsnfrq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOOevxvCyRg+5LVv6dJA5Y9OFXZ16gVOWzgsBucFrICrb0du9vOooabGXGmCi69xFrq4iaIaLH6bqj/bOEs1AGRuj3oT2lAGhvGc7JdGtAM2dKOo4DHFg7VJCNf8Ka97eiDeJmaeQk1KfAw6ougjVtdGJBakgK7yAt426T+obr0Ra4xlC8iioatwmyslJuXPnx0N/q1t0/Jq26l5plTlis7P/XgQaWFwXtC2cpuhdvvsiJSJYVyrW/JVA8lmN3gPSVFxP5k2Lg7VqtSXAKJ92R+5Id9d3QEXqJgZZ+6+GDwf1MrxuLHGxrxBRIm50+WqVtovpIGPad1HZ+G9aG0o3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd/wwxBCq99LMngKmauaoObG5vEVCtMDj+lvklUTn7k=;
 b=lXr3nINLb7Kj5m2NPG6/lARzCaMSZFRK3G/8loGQc+9PiHBqV2njVI5XZ6a7T67CZ1BoMU9mf8HW9SdlgklhLKBbZlOu1LDqboXLtDkpg8/dMVCsoFDelLBXruREC4jgtaQ5RkuzzXQuxKMaQ+w8H5VsGsNbeAfznheXutuG+OrNHN0W8/cRg9vuADgOTRNmlCvHEAyUk44kupU9fQRH3pQY0ddTlfki2xXP58V6I/3Oc8Sk3W+KUKStBkBUfIOKpgQFodVvciVfZDA27aRKomJTQ8cIPi4KkoT2ObycqqfTl57uC6j///AKekgGVjqxI8OmCToB7hY6OGFRobPc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd/wwxBCq99LMngKmauaoObG5vEVCtMDj+lvklUTn7k=;
 b=eyqfjasagVdXmQzFqnrx0T05TwnCEiFY7JZT9EUFzF4CYl9yix0cwmQ4SMxwS7fKe+TXCEgQBHgdbhKMtnfpLW/RaNTLgw8roxsIbgvmcG9kfEpik3J0Nw/Qvl3UZm4Mfb2jsXQzbHKfvUFQbhJO9+xcbV7GgV29Goj1kiiA2Bk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM3PR10MB7911.namprd10.prod.outlook.com (2603:10b6:0:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 19:02:14 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:02:14 +0000
Date: Wed, 31 Jul 2024 15:02:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: skip tst.symbols.c if no /proc/kallmodsyms
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0414.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287B34CE377B4B80C34B2BEC2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM3PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 0367dec5-9c31-4304-0d0d-08dcb1934a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iKjzUFgXD6Hdi33A2EyOU2eHoy2fyh2MLzV6s74oFAUEgs+p36+AvdPpvv8k?=
 =?us-ascii?Q?5eS1huoe/GUEjEmkuzdWJYJwqyJPqouS2YDA9AeoMeS1RMLb5lr6Kn3c328z?=
 =?us-ascii?Q?PoCiJCGv5YaRnNHkb3ADkrYOljC4vhGEV6UzAA+WNkHA/UYWdELkVXeKmxkQ?=
 =?us-ascii?Q?tSrYS3uEKe+q7LgdbYiTSVi3Pu+Vz7vujaGor6h2p/nr/TESpjW0B1nAQ8i7?=
 =?us-ascii?Q?i+oUm22LKsoqP5zGdKq91M8r/HlXdtCx37HcICKCzeQaKvsn5I+8u5Y44KeY?=
 =?us-ascii?Q?ncUqGSNy1IXMJaT9jafyyXKX66t1Uo9dxgnv9+PUtivTUwodF3bLFzV/BdkY?=
 =?us-ascii?Q?RID62OsA30/3QcEJ5pCCFRTN2EruemBUfMcWuuwrSHVv7ZlcktXYtLQySx5P?=
 =?us-ascii?Q?n/G5lrr9l4T1CXlm1w4HUIaMGAOtM5zYJWn2CHwZWc0lErpl34k2MrLVJZAk?=
 =?us-ascii?Q?vs1lwJYd5xKtBfyxFZVusnU0jZvchBzw5C4gD7Ud5IzkfgVeJmii8emcz7w7?=
 =?us-ascii?Q?RsOZzeqcq0mUGNxuc128QTpjbxS9uakkUsVtWrKGBPOT5p99jd8oxhvis4/c?=
 =?us-ascii?Q?P2mPDNCdtqAKux0h1QY98B3Y9L4ryb6HLo2qKxFmDXdCPhbIdEtLux51j/IR?=
 =?us-ascii?Q?fHCASBTpVGRBRGqNj5kt8emwKi6nAiTRTnfmiIpOd+i0Tfun5DqeISUaJCQP?=
 =?us-ascii?Q?7f2LneE5AJGKj+HDckKlVXIAx0u/7svElczsInQH93qYQDWD3k3QU0x8Mrse?=
 =?us-ascii?Q?XBpYKytkhwCk8tnty7potBJWnArMXCWozb/xz0I+9sAQQ3IlefEtr4OgJrLv?=
 =?us-ascii?Q?9X0DdyuVCYhwUuP1uNEF16q/oAKMtYNXw5RTFR7FUmqKuz7h9gV0Ig/TdE77?=
 =?us-ascii?Q?ESSFwlKXma5wBIDcd2+SX8iZtTM72kOIoTqvWb1JWwyj8JsXxHcSmpNQDREd?=
 =?us-ascii?Q?nKRAm+oJoq7G/TELfNH6KUPkRZkEsq8LhcIgGrZE3JszU+Ot5RYFYRfq3NrM?=
 =?us-ascii?Q?NroI+c6+NCBP2oNbt1kmClMXH27pLTthXHvUkYdrzIhwPEG1vgCXwXsWInYT?=
 =?us-ascii?Q?IdhP81RT56iXpwmOe/ODuWEjMtdj0wc1r4B/TBKSuBFnKG7uh3Kcfral8vZO?=
 =?us-ascii?Q?K4LSQuyVL+vuVWcV40BfHhBNNHVYugblKBpbEnwO5R+9+yaDY0uxWregSDf9?=
 =?us-ascii?Q?dFJm36rKDMolW62miuh7X0OVHubhxsDs4vcUiI3ckzJUrsWHzIpZFBkxjXil?=
 =?us-ascii?Q?rmV3pWv3erV8hXRCy5hoEhOyIO/6xaW0g0Wags4V1RVlqfEHgJwSLd+iumd/?=
 =?us-ascii?Q?QKBO1gKLNm3lXNWM2A20CxjeoaP1KZpKIjohxg2LV5zxf5U+btqLhgkOlu46?=
 =?us-ascii?Q?AU1zRXY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uA6rp6bR7x8k+DZcmd6wVfIshkGfRzeiqNyCzAsTHuOhJM+82jnsKfODfmRn?=
 =?us-ascii?Q?ABAz67zjpvf3G2rKv0qeg5xb3AH2lVyVsz8Mo+G3ilteL720CWDMRcroG4VM?=
 =?us-ascii?Q?J8KPqWmZ5f9jNJYQy+zCHled1o7RigTxWC9/AhcjXer+NYLdds+XZCD32bhg?=
 =?us-ascii?Q?cXfuTo9e1hoRHynKaVmJDAXzV5+9X3Rl5n/PCAXQUdyb4TrsBcJls2PGe141?=
 =?us-ascii?Q?YVBtsdNyGYKfdRa+aRlNLdg3RCNS5LfEVnFB0hKbQR5mx+fpedkMWgthWJJ5?=
 =?us-ascii?Q?88Jqn4guq4fhiwjlWbhhic/sreeRPgEA++qsg5UG6TZD2UKiMSZ1T0HLxTEi?=
 =?us-ascii?Q?BzUoEoYk1dTxVW1GxbtcyowaI50albFRv1D6VtSUWEtCDAK1NaWelGICwfUE?=
 =?us-ascii?Q?zSv4sgXpYxqS+0WUCgfXRIjTPqwHod4q/l8sOtFHRPGU8tM+OLUu9U+rzvpL?=
 =?us-ascii?Q?/EVVCq05nCEyCKbv9QiwuFLrJxKS5mePfEs23G1wOrChzkahjlaZof1rVwrK?=
 =?us-ascii?Q?HHlTGFaMwAZQNAMDypKCCRdVMJ0ZqcvoajYfdYwWEMu8k4EApA2ca231clr0?=
 =?us-ascii?Q?jCiOvVdHvcVBJEHASv88VGyY0CxGAbqZUi7uCic8jeu3HBIvIgyJUlN7gvgp?=
 =?us-ascii?Q?k3wOhjSwobwWkO/aPwt9mmtcX+m7gO5pjb29YoYHvx/KiCgqUAfPd900oObq?=
 =?us-ascii?Q?CyED9IlJSaH17yN3YOS6rNgQLIxJofs9Qxg9IZabQ+Nh8kEanooTHXOagtN+?=
 =?us-ascii?Q?ik7dCbwT9qq/t5QaoFBYebqAwwV8T9N5UZEDuEGAqp6Bh7/Gc4Do6SQCrrug?=
 =?us-ascii?Q?644OKqA14vAe6lF+KnVD9RY4RBhm/QUcKMuBBfMxOCwvL82XAAhlOjGAXJZf?=
 =?us-ascii?Q?0VRC2YpCpzHHiiY53+jJCFb/zoqCWKvemjrNrM7kn+4GgWwwoVJJQJAiAkuN?=
 =?us-ascii?Q?frE+yBe3Q07TeFV1fAZNke/spoPWzWJqHvK2/C57dz94alaatVZrupGfTIts?=
 =?us-ascii?Q?mn6g/d8ZuhtnoZfiNoyXCe9K5UzINVeKOpmklvGaW7UNItwmwwyZW1wgCDhU?=
 =?us-ascii?Q?ABVf1j7ygkJDhs/pCD5gM0Lb2J3QEtLj/k1bWB4IIjC/uAks9aB8hNftL25M?=
 =?us-ascii?Q?ZArM+xw+To9MiqB+v9/ewXSArIZI7QmuZMDzfL+BVXvH2BNfSlEvDZc1jzpg?=
 =?us-ascii?Q?9IsQlqJleenVWfBOw7vXH6iw6DJuPZk3USKn3m7jFM4x7V4jtGUaB/QFqPVp?=
 =?us-ascii?Q?amQFNpowydP6GrwblwjV2lczLjH6uMkHWwc7lD69OpPZ+DmkQnxA5FuPMO8W?=
 =?us-ascii?Q?Bd97q98EWRjpljcqnymZu5oX6lTA4AJo5P1gIVmZYFQFxESx3Hp7Vpuhs1BY?=
 =?us-ascii?Q?HPk8Goc+8m7h18Y6E0AXdi2GkLmmt5360+4mrJmTBaJzu8D9l/KbLotxnQ+u?=
 =?us-ascii?Q?lGmx0SphHsbFDzbckewpJE2nTW2v6ilKePRp6FqZEhTJULzdNCUSjVU0vAK/?=
 =?us-ascii?Q?3GUbfeWxcHdVM2wBjEzxFgFuWZ0Q58HYSV6bKBvlhvCK/NFLSoEfMDbtdWEk?=
 =?us-ascii?Q?pp1HtnKHsxJGdT0js75LRyh6WmLQJIvlWVNbCERUuo5A6U2irBw1EQopDUbD?=
 =?us-ascii?Q?H3xgGjZh8FzK+kBpzAKWQGc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DtX4WeA/rDWQmAY32IRA/My9zsceyAEq8CTht6g5IByxcAKkRYOqwv6FFcS5meZRHGf4nuOruaZ6PKBfNJdzp+et3990UczQXYX3GWD1+WtXsDKBWYXR1fMq2javZ48fRd503up4ytkA2ZOHsLDPR7JBekXZNDmfR4Z9743+T2TZY31GOMtO1wBgWTVEsqGZXOQ9TmmoUrj6HlddarO1gqHH4dBncsKhXWj1bMN+RsxczB+AK4oRyQp9Jk0uEQF63XTNZR+dctXrrw5bu+E0/svNRJkkCoPwgARfVTBRy9B77OMCqzc2NXN5w41N7lwwmzw8B8tAnXmRj+W9j4YfO6ifh0AUs0VP4w9RiQRMI2lK2WteygWR+HV8e6dQkAenyArilvbkjdn3m4+/T9f1dEUoHhGQvJUt6wbl7vzTmWuyDXziqWcx8qhVBzrB48sjCUqb4kiDTy2tX5l9LgU6jx5SjqtIkmMGL/oA0PRG5diXDI+dk43katIzSGF9Y/7GoaIh6y7NRrsrsg/O2wDSaTkp7eL7LDh/tKh9nk7vt89B7Jldy6ztObP+dVDLI9y27TFi8fESw5H5lylkL0brhl5VXYA6QcNj+gJ130Kjw9s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0367dec5-9c31-4304-0d0d-08dcb1934a76
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:02:14.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvxIeThyAbmUp12qq1O34U2xAq2tdXgZFM4bE7zls1eoNMawhSrJAFmfIrihEWh5lODLiwAi0uqmNV78f2crVWm7jN//abaMWvFdvy/0J/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310133
X-Proofpoint-GUID: 86roaW5EQvLI_99hitrzdPyfPEk7Htps
X-Proofpoint-ORIG-GUID: 86roaW5EQvLI_99hitrzdPyfPEk7Htps

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/consumer/tst.symbols.x | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 test/unittest/consumer/tst.symbols.x

diff --git a/test/unittest/consumer/tst.symbols.x b/test/unittest/consumer/tst.symbols.x
new file mode 100755
index 00000000..e83d97f6
--- /dev/null
+++ b/test/unittest/consumer/tst.symbols.x
@@ -0,0 +1,12 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# If /proc/kallmodsyms does not exist, there is nothing to test
+
+[[ -r /proc/kallmodsyms ]] || exit 2
+
+exit 0
-- 
2.45.2

