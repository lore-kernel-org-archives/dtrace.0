Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708752F1FFE
	for <dtrace@lists.linux.dev>; Tue,  2 Dec 2025 23:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716704; cv=fail; b=lMOLPmj9l3EdNUhhgy9BXU1jakPuEYzooXVahL+lTt9DjZkRrmHCLpzL8dr3pJbarnzU9IWEZQW1ZJMQRJdwkWMlofXvhjv2CqUsmQa7T6+3e+/s5+1EDgWA5C+xJyOgzVigmGEQqoVQ2njxg1gqTJGNGuuoi3ziN8E8qqleGk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716704; c=relaxed/simple;
	bh=u1V4jEZ2aJxvVN4T4KnAAfC0su/8p3K5aEQ9TatE68o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iQGDx7IeqJA3ipia+vBKx3RhyfPpEf8PQOQy996m+ypJ6emc+zjTaUc4iYwpDlPI6WFc3WDk7iPagLgNtnFilSBsQ66aR1x8a9V5D8ovUEIH7jDmdioUrTxweeT/Xp14PcB1kzfxjfMrMI285da0WvU+8hKsyDcMAa+7WGAHVZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q71PYKZK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l7rLkjO+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q71PYKZK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l7rLkjO+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2LCbdi1126003
	for <dtrace@lists.linux.dev>; Tue, 2 Dec 2025 23:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=Zwy8iIdRy4OXL65w
	qu7J+9k6ms9/oNHnzqvRR50E06o=; b=Q71PYKZKueysAXARLuymcLOuBj6H9oHp
	XyAFuvusPXSO6IOrMmxPv9RpOpEULxAZiyfd1PoyErGeSQ4g+ZyJk/X7CcumdhEr
	wgjtZV+ZqIDBkdTF051hJ06eUin+7HR2WtAawTSXuLRH/8i8kgEqHhGKtaQRB1ZA
	Vj3+Mrt30tIuO3OYugW2mcekqGObYygUvkn6bqQRaD7Of9FgYPwWEg3sLhg6fhsA
	WdgxyGQpTaRtwAjuZQVQ6krFv5e9OzTiVYCo8XpXzfpvfk/4lk8LWJvft8/viO7n
	afqiEeKQXrCIuBNs70KODW9ryMtlk9sGQ9oonTuf+JP36mLEq2BfgA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as7f2489e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Dec 2025 23:05:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B2KwJmC035383
	for <dtrace@lists.linux.dev>; Tue, 2 Dec 2025 23:05:00 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9m0f7d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Dec 2025 23:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqmv+SQZJQXkmBpmfirweJcXyJ7+DgtsCgO+Wf5x03/mOL7gnz+lo5fLfoK6P7q1YCBx7zCRJJGL+Ioqy87JsAMKa5yVcA89NQBBdVhOHgL781BYmI4UptUtBKg4JdjxUY17dn3q79hGzIyFP2kF9uqSGXFoMkp6/yWSM0CwGSGX84oFKT7H4iVF4ejNctdRVaz7xr3NfIrhUVBl+GcUVF08KfjeBpQ3v+yIMn+2+pnlHoNs45DF9LH/+3LS9CdaDfXvIWAGdARrx1LjPo9kRPuwv5QPqNBjblsGmURq7TU3wDol6OIguJ0z3Qk9SsrTcTWOJvDBazixHenmqhqRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zwy8iIdRy4OXL65wqu7J+9k6ms9/oNHnzqvRR50E06o=;
 b=vW/CUYDh+50ebZumef9x85teW+HW82MMSyNmD+fos/1xvsglUMd+6473Vm2yeKFSjV0rWI0Y2REVhCVGPr43VqfbGx8MEH+EsxlOePR2K1IHZU9fvaoq1O9/3CmUrmxfTNIrb/zR78xrkP5fRPaqLZ8CaEbrp4rCr6S2hvbFR/IuFIVSlO4+70RVa9DibLSXl4rxQx9NT3hmnVVV7nT4xAuZdXaxW9U+YBXP69EliiSoO33Jg/hFMirolT3kXtvTbUsf2osJWO2iGDevqlTOHufUtUeSxsiv+/Acmgc+t7LKVMU0MRlEh53jWhJW8Cgr1YyCmzQbXzC/Qv6rJ3kOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zwy8iIdRy4OXL65wqu7J+9k6ms9/oNHnzqvRR50E06o=;
 b=l7rLkjO+pT7PZ1HxUjByhk4BLPgzhxrsrU0f0vz+Rr4Xaw8DBaWFIiPv6CNRZsWN48GPk4OKSqBSw8/AX9KgQ+BPu+ox//nO2XhtmfpUvjyPZxCSxmUWD1jUMWWXya6XLHHGgS7d2Po8h+PeOwtwraRg41co5UiTXbBGY4VUNtI=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH0PR10MB5755.namprd10.prod.outlook.com
 (2603:10b6:510:149::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:04:57 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::6349:1ffa:68ef:65f9]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::6349:1ffa:68ef:65f9%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:04:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH] dtprobed: use /proc/$pid/map_files, not the filename of the mapping
Date: Tue,  2 Dec 2025 23:04:53 +0000
Message-ID: <20251202230453.124306-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: e3938cd9-c34d-44b3-24c3-08de31f7369b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cEWn3vlScE3Nxq5v+Mvpv+xGf7247a9StLXwYBFiliog5JEQOruS0qebmpFU?=
 =?us-ascii?Q?pVFDQ3YGBHz0ip16mVi7N8bQen2rechHuCoSzcyuXP6XnccuX221QgSzfAFM?=
 =?us-ascii?Q?ltpdVjQuAVRgZgsdWU9hL5h9IOwEIAwKxUgNqy1176Tu5IDGw+QveeZU7i7W?=
 =?us-ascii?Q?RqTUZ4ORMqnWXJO5q/e7jBH68YbAyVMMB0Ks2Fa9KqvtsTZpE+N2jo7j3e9e?=
 =?us-ascii?Q?LDgIaQxVYYG6lMuBT8MBQPg5l8NW+ASoyEcSTJtEnF4u0kaAjVMs+rR93yt5?=
 =?us-ascii?Q?33DkjUbgLun8akJK/STFNWK++IiteBf0l5ZCX/zz1Bo0n0pZgRdHuC9W89t9?=
 =?us-ascii?Q?whfmcO4zTlhLxZWteQhlKJrwa3R8kW10b2n87f4xShlTHp5V99QsfIkKKmfh?=
 =?us-ascii?Q?b+/Ao5jwxRbnEIJzmr5zyiO7yD0U2/6bcS4VY7ogASOUqefHxFLWTWWo/x4b?=
 =?us-ascii?Q?gqqaqWGGuSS4nYi59d1HzfgwAxXdh1aOGictWOZ1dA6HCbBmi873ASwuZKns?=
 =?us-ascii?Q?AABQJupnfECKxjNiYdGrcZQ3QCTSHpYttWex/GrGWo5OuoxlD1EnzknWh14o?=
 =?us-ascii?Q?E8V7h28etbmNbm6KtR3tGW1TUGTE9rrvWE9EzqkTGtWw/otMbTl27nfaceyL?=
 =?us-ascii?Q?E6HBsqrgldAm9NhDkzwKI53lgVGYF0TX0Ujy76j0V3O5YAW/akomjHewC9yZ?=
 =?us-ascii?Q?3XyZavdkaPB3gStxsdKaTlRnrj1dvaIAmgLVsXPRPbWEkqwvN6L6tV75XpIu?=
 =?us-ascii?Q?zoEeNqcssChdWgBt6/GCp6nrw10pGd+OZQugz2yibPleswa/Z7BJZmBhQ3FW?=
 =?us-ascii?Q?NaXHhE9myFjeS/d+ay0Yye8no05Xv/ZNRuUtIXTy87SHvzlCbkCEWEMZSGyy?=
 =?us-ascii?Q?GR+GP0sMyJ1EzHiZOqiI/17TAXsOmjJ1BPTdFXdcPZZ8jAglo2WjmUHjuFrr?=
 =?us-ascii?Q?TWWRIZsGAlazu+sitfjDE6257PwGtqScWjWM6UUMOTQFSL70H9O7KBHwWBZr?=
 =?us-ascii?Q?/nrr1gQ8bmXZJsPovOgxl1Diuz4+4sr5nOv0RHO8XaecKKNCYLo1L9YC9gFm?=
 =?us-ascii?Q?I8Z6qZflVkNkwjj4GThgb2HZl6H2Y0JVhyLH3OiUIC0zg6wz1d67Jkg79x9e?=
 =?us-ascii?Q?A5JGhICp9u9MhangujsU4PwqK6qPAlNWUOS93XDweiqLBwOfNrOuJlkmIWsy?=
 =?us-ascii?Q?bCewjqak/AyAw6FQYJa7ryPBguSp/vTxEofi1wjhoZOHFK7mbKPtPYFwW4ZU?=
 =?us-ascii?Q?Vdsyi2Di7DdtMrEA/O4AERk3GvN3H+n/ExhDxcoqhz+WUlkim0M6b7ukGhpT?=
 =?us-ascii?Q?x1VrIA2hcYotweI6xTFgTKJrGySzADF6e1C0fAQ3Yq/5EdtFhXN6qUPB4/aJ?=
 =?us-ascii?Q?hDXzqrclE4dH2IbQPNHKpKRf/Rx6JnvTVQ02kCtSj9Wl6nbSjQx7FWWKP+Os?=
 =?us-ascii?Q?VomTOijXN9hsKeYyMsEPAHCXyaw6+Erv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K0MG9jT3/ulkdFSXjEumlZwMziqjqeAO3dFnbaeUiPQXPVd3oeqXP6044vZl?=
 =?us-ascii?Q?l4EC/L9OxuUVhQiS2c8k6VWm0syMheJRfABSpbY97TktjlPUCEnQuMFDeKLw?=
 =?us-ascii?Q?6j8d6nrVUbw21/+rakNs+WleJ+5KMUGDXSjRr6Fol6iQ7miZXcC+8Y/tbA29?=
 =?us-ascii?Q?ezITjJiFz0BPs50wmZoVKOwYEvC/y0TkGrrQrk6FGx5uo+ranpSQy4ZnK0LL?=
 =?us-ascii?Q?I+LPSJdKfjsMqgr7ImMdacNvz4RgfPeK96tJDC8XrFA/hjFFYAhPrFFvaLYU?=
 =?us-ascii?Q?O0AbnsdjYiF2nRJlY+v+whnAKztVZ7HAmK1pu1xxBV4MmZJV80pPGK/a+Ruc?=
 =?us-ascii?Q?i2UohMYNe2oVnFvVfrqkCwfq2rBUAo6RelJB7DOsj1O+NlZ4mivZz3/legfa?=
 =?us-ascii?Q?B0xq6SYzorHLwHLa/WKs9usKUc4MWNXS1ISaSr2zLc7e1tQM0OY84hdWFjN4?=
 =?us-ascii?Q?t3SmKTqJyxSwivVPqY96GGEaqw/7GHHiEuZgcybc+K/h93aR5qfaNfoPLq9c?=
 =?us-ascii?Q?YJbtv/fHrfDQDohz8c6Td7tVx8OzIZuMTAvQS0JfikVFI2nO0zFzXAk38JeC?=
 =?us-ascii?Q?zOkB0ss5z24BgAuctIFLwmRG4/LStMFOePnRIQuyGUmrSXZsKjcHaVg31Syk?=
 =?us-ascii?Q?O2u8NKRCHvAjcDMZUwPafDSDhl7saWS8KqGWWn/lhhFC2l9PIeLX1yNKGU0Q?=
 =?us-ascii?Q?Gu4RCUNZAlId6HViDafOgMw4FEbbRXKse/jiYdk9jCwn9c1bBD06XOqo2FVo?=
 =?us-ascii?Q?DVwA5rH2v8itk7Iyz2YzmFeDQOQ3WIGBeiZz3Gaqvzfe3IjeMLiFFnOaMRLm?=
 =?us-ascii?Q?bOBy4eM5TaYRmfMTq8CnLoaPAy3dwZwqaOF7hGK/cYKQF0jS/5q+IQfBZXjL?=
 =?us-ascii?Q?McnYLyIkeDM2me3PpZhKqVZosUhyylFwQ4ullydM91/lQt9uGaSUY6fzYc8W?=
 =?us-ascii?Q?HoL73UociGhDiOyhrHdHVPgtruWSYBcr0l0cE8dLdmLx+Ro2WBO0ugzCZ59F?=
 =?us-ascii?Q?o/xtKEo84fo8yYXLbx4kYcCspgEGzWoJ+h3ckqjIi9/PuCYjavrhwNVPipC8?=
 =?us-ascii?Q?hiLnzkXfrMY+di+41wbxFrxzrI4ghZY6nUUMtYL0q+qRULkjCmPniR8i7OHP?=
 =?us-ascii?Q?c4Er0gOQ7IGvjR+i46axZrWWimRQc5AB0vrj/9EN1H375xwT4xq8DRK/EWZa?=
 =?us-ascii?Q?lBOb5sfTiXpchda3xRYFfGdafzPjaW3y7KE40uyJ8v7TMBa2gLmg2tewYVso?=
 =?us-ascii?Q?nlc1jaLroLrteHtDB53aftYeAmoML3ud64qowLW5bvfFbuuYg8j4oqZtUUUZ?=
 =?us-ascii?Q?qFdHhgyrEAGvBoZlX6FZzzc5fGpK2BPQarqrM0rxBU4eD0M5T3NKlZhvnxpx?=
 =?us-ascii?Q?OhIlWerrDcm6mdX4Cg8zu3HraBvFEinnABpZqXRD2F1ut0UXNMbI8wD8Am7k?=
 =?us-ascii?Q?Oe+mYPvsfZIxYdeYiC0vLXj6FMngcJoV21gg4kALaZgHsLfKKoLK4unOdQpt?=
 =?us-ascii?Q?/XJDZm9j/ShIBIbMWWGEI7PflGS8kwyKyepBQuPA7RAQWm6fOA5UiFIX0tjN?=
 =?us-ascii?Q?+oH2OhTcJpJSRS2pNo7ypmbhX3tQA9Vetc/3Xu543+dRjCr2Ocjqm3ItqXG1?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gRs0f/G47HIYzTJ6lKPMPqMcp6QwRnunoyfscIhhbeIqWeGYgFECPM9wp++3SfDqhR8XSydk4cPoC1YDeVlFGb+nlXsvCmH44iIGVYALyMC7P/n/hioWNLo9JzPZ6KmmROMn+sNcs05L6XPQgkGqh0SxAQ+V8mY5c1c4ZDGvThag5EFnNd/4rL5BIvtQMTVJo/NBo7dl2jiUDnHEIIS5D3iTiKNZcf3bSI6p3E6ct0+Z1hY7ljehMV4D9T1Uu6Bw5Vi4OZBVMz3eCPu8fV8INErSy66VTJg3FKxiRk2Lkz95pdTfRMvk1xdS6CWySvbIm6Uulmf1/n2dCv438UclHusltxDtIZtGLwBNwbHLWDPqyiRUFzSI7gsavFj6Y4mzkksJdj4UV0gJa28ZoW1vzuFIfyPnOzMOek671pRakQ/ANHQfbFn1fl6qVtEQjzpfLarN+KxVNwFSsWNLqMk5IRpvvkD6w00j3VfjIupm3L8dPL3nsqeZ+wIhwLSyuv5Lma4V7VYbSlFXwflNKp51jn/27gnLPlg+sihL1EZ0wia68xBrvA/UX4Mn+Y9C7+NsV9XFSMgPWp7Gp1tFxc4pkayEPzt+9H6lJlI7lmNdA8k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3938cd9-c34d-44b3-24c3-08de31f7369b
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:04:57.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0lgafpOPzQSILLODJJk/z9Fj2RPdMOB75yGoo/ozy+CvxICEhNadlW1uA4Lh6Xgp5r92hyopdJcXdp+cM1doA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512020182
X-Authority-Analysis: v=2.4 cv=QMplhwLL c=1 sm=1 tr=0 ts=692f709d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=jvCB_QT4xROPWbBB7FEA:9 cc=ntf awl=host:13642
X-Proofpoint-ORIG-GUID: SjgE8r9RhWxKl4-GgG_YSNOYqziSl7n2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfXwmmJ8wpP9bsw
 loDUIDjJc9I6uzfyHGf62IhaqtROJtsGClFS7VRes+0WHW+GOYlwND5S3aJeOuWc5zsLuhUcxYB
 udg6PWfvK1O550PQoGRQaNiSIobZ7re7X+1kRdQxpJNUFVu0actK98gpjpZOShdTBH+8IfVV1GU
 BLa2L0RVpqArDyBtezDdjvcRcRcNvGKjYr+Ud821a/KQ11ljGkwJ2qPEBYHJZ5xjf4Alf9pML05
 OGyXULOKYdnYDcUOQVgnQN0hwuJYGrgv4tSYBmgdax1p+qjJ/BoXAdsW8bVUYAIYDheMkC3FAVb
 4UE22woPq8kTaz1ePCEjMbMTARQw+8igW/p5goJTrcMrYL9i7pt9xShdrKVlD5oTlM6Wrz/TGX7
 blRtGmZYBGhSn6Q0LxapysPvC9xvpuB50rm/cWUe5IpCj+uDWyM=
X-Proofpoint-GUID: SjgE8r9RhWxKl4-GgG_YSNOYqziSl7n2

When hunting down a text mapping, prf->prf_mapname is equivalent to
looking at the symlink target of the /proc/$pid/map_files/* file, so
opening that opens (say) /usr/bin/blah. If we use Pmap_mapfile_name()
instead, we get the name of the actual /proc/$pid/map_files file
itself. This looks like a symlink, but it's actually magic: it points to
the target of the mapping even if that target is in a different
filesystem namespace, and you can dereference and open it to get the
contents of the mapping even if the symlink is apparently "broken".
DTrace already uses this elsewhere in USDT probe lookup, so we can
surely use it here as well.

Fixes e.g. running programs with probes out of /home (which is jailed
away from dtprobed by dtprobed's systemd service file).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index a808586559d96..9a6928055cd13 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -487,7 +487,7 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
 			 pid);
 		goto out;
-	} else if ((fn = prf->prf_mapname) == NULL) {
+	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
 			 pid);
 		goto out;

base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
-- 
2.51.0.284.g117bcb8de7

