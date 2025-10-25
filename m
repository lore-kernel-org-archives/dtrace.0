Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81091301015
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761419880; cv=fail; b=aDqhACP8q8TZn+VpZ3yidZ/Ydr+nvewXA+nWZwksk+iyZSS4R/TSR49GIY4UbUnbR9vb3ECYI4R8CDyK4rnkewKVGFAKVvCWJFmakH0XHE6xBXOUz9fNhQcNwJxU089rC4JMnpL1/gA+tIYSmJUYTgT+R9J+yH9qG4IUg1XeMX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761419880; c=relaxed/simple;
	bh=ETnI9kunNALwIvl8HVsmLhrfwj8G7fW4F++nKhQk5oE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JLOMSM06CdPqQAP5jjhG/ipM5OGk/+ekVD0MT7RbItoBJV84rct5PBkfybhKv1tuOlA7jYRtxXUVLNrap8N/ojsWzq+QawbOWBIBTgmNvQkpimuSniudxkeP64csPp4IatIJ+omzsFszZOONMGYUjb1x6I0D/YG4BGZwho/6b4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r6RnWyUz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ehK2onAK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r6RnWyUz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ehK2onAK"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59PBDKlL012091
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Bub5qWsmLtyd/puG45xXwtQHKmg3SzGkQW3U5J4+8eY=; b=
	r6RnWyUzI1xAK2VzLaEZdFsk61VKz1ZHJaObUxv9N5sn+BFRVXaYU5wBF7yC18IK
	Ygwmt3SSaU5KOUELK2ibgT9YnWmXVLMsITD+pMWILyNiNFEAdbrJMPxJpj30Lhv7
	OjddoRUmAK2LTNjhG9hU36KiiQxPSgnqMy8ZgzxsQ+vn7fA6Y5kplQTO3OA9OtTp
	HImxoSD53H3GH1thf88Cg2McOJrGdzjFH54o2Dx2dfD+PYRqB7YxlU8kfeguSVHu
	753B33RKvHOMFklAwN/FAM7HDus0neJadAt4EuO0yMl+c8KErk7oAzBya4xBPX1x
	weSaXnc0ZXFR97Fe1pUJSA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0nf98srv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:17:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59PJ37vn037514
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:17:56 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n05evtn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZKpawuXy8QxVL2CPPRcM6b2UpTVS6RbfMJT6gV+tAexrZM2DfTtbVfuUVsnfh7J+VORTgEsh5F5r2IwFCOQGfmTHkguTrSVaIgFa1e+hr+WTa7gQsN7vfMnUFYbbLd/ES40URdeVlkyUqozqDWlTGKwpKoWukqvy3n+1FyG/qufUn0L+k6pwd02E/DYmwqah6iqzEphMZtkz8E/YfzUgLaQ/yrrUFnHzc8HSHeB5VXo+3U2tMEBcfAkZITkdklIHxb2V1jVHELNZ5UzogMJ14n/LR2soVp2oZOUH+QdIyCJp7GSu4OWidUKH5LG5d/UOUcGWhKSuqI/vv37+XahCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bub5qWsmLtyd/puG45xXwtQHKmg3SzGkQW3U5J4+8eY=;
 b=vSlxE7GYwcJKrUFol5mR2CqAN7W5lwuzBeQlTgvXPXBgDWnblXwQUDQIVBMdScSRP1GodA56iOFicV8Z9T2Qz2g8t59tvOnWPYm1Tdf4KNK4eOptgp49d6y37jbqvnwaMdX8YHqwyQ7lBYWLbNfs+aG2l6W9rEjaL3Wr9wWMfu/UWiakNkhaIQlugYBXWbjRqmqvNDIf6lyj5paSx7sFuixI8SVQcKUW9wbL9wugCRAVE/QOPJySBw7OT1kyk8Tz742bwS7OUepSkgDdTcAeC/oQ86GGF7M+bU6nsk8Q14gPJZjGFaVno1WjI+CdzE4o95po6j15s9A6SHhNzip+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bub5qWsmLtyd/puG45xXwtQHKmg3SzGkQW3U5J4+8eY=;
 b=ehK2onAKlGLNVnmo740njaPQy1MWHpw0Phog+hCvbEfD/6ftfs5Nv6X2rCiD6lJMYk6hkHITtsOxefpyWLAP/Em8RJ9vNW7dRnmdYOXsstHiEzWvxoYh5K9i5Y4ACuZ2nly97v+jfQAtoptwlCbX7U7MmkHv6qXBOyuWovmUXLc=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA4PR10MB8612.namprd10.prod.outlook.com (2603:10b6:208:55d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 19:17:53 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9253.013; Sat, 25 Oct 2025
 19:17:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Add more Orabugs to dtrace.spec
Date: Sat, 25 Oct 2025 15:17:51 -0400
Message-Id: <20251025191751.32158-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::16) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA4PR10MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2e76e3-0b69-4aff-f245-08de13fb31e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ahp+p5Lv5umHVXKRnuspQa3d8TFMStVgS4yBqEH/kpUYrCs/7ByfHf0ei3I3?=
 =?us-ascii?Q?2PP9URbkygapIZqPs8RRcMVcc7zeuRhF53COnSDAfTI32KCebuBdDUabubee?=
 =?us-ascii?Q?zsWcj4sgQAfkSreDq83JH0mcV9NomOhB4tEpAQQex/Ph3BePKqFKL5B5UdFQ?=
 =?us-ascii?Q?vSrgnDZLhaNcxTSPIbiq/9oXvwtxwkp/FqaprP4aetlyf/UWAzlBFlsvAb3d?=
 =?us-ascii?Q?z9aAD923XETdX44Ky9nSX/edhwIyD1eDyJgNV0qVu6Eb2tVQozAhih9eOCIK?=
 =?us-ascii?Q?iYCWYDjKumbwVit++zfTK62d4Qc7VjYveXdSUHOwvalouZW23aZZMGJ6WKT4?=
 =?us-ascii?Q?B9cJ2uFTr0gkMkdbBNwOuIdRQ7SYVmYzM1x6ISn6kS/1S26PRchzi913a4gZ?=
 =?us-ascii?Q?J6Wi++nL0yDTVi/cmFp6WO8EtipNEvZlgvxGQpk5+hHhS8Y/ukOIn1YBBuAQ?=
 =?us-ascii?Q?H14dh+NCvNYUZaRiV10GFchHZU87NNW9xxo/NRRKKSzFRiFOAqNh0s28vwwD?=
 =?us-ascii?Q?8LFz3XZLIlw004PCLfTK+wK0HU1AwMFs5Vd4nYdyy1KS6gHfv9OGdT7xLJRg?=
 =?us-ascii?Q?zhm5CLfJs8PZUkqZ3QToRpcBfCh1Ev7A9SYsPpew+Aq272ahlaxbyqBP3qtz?=
 =?us-ascii?Q?f3Okcwjpj9hFGk/akEUxQQVuwqbn7uQzr0HEM5nEBveiPypHA3OF2L6t03nw?=
 =?us-ascii?Q?Nyuloa4zaRSi1FXfKgy5ViZ2dqzHvz0y0sA3HvMec3ROkKUz/88dcevMxWB/?=
 =?us-ascii?Q?I2OIgPGcOF0Qdg1lDHZi6BbX8/9gzf5cUVK4Y31vMGqJEVc60O2f4fU9SaOs?=
 =?us-ascii?Q?CS4A6w9oPf4bacnJE8An48mZaphmgTcEqi3bKTlUqjRWhGNef/o6Kl9wC84q?=
 =?us-ascii?Q?sVabt1dXTQqChvOCn5aLy1dZpDVamF8Hrkd3ZE/VZKm69oGjRdFLWIPr+9Vn?=
 =?us-ascii?Q?Cy2Bx0MIg7idrQa/EK+AOsgYf6rfWy6brP4U2bekD/b8jY2WJQHSSbzy6pqq?=
 =?us-ascii?Q?kz3rsu8oCZ7YZYF2jX26GzFmSjGfIao8Vxm3Lvs1Gm1nin0nk86hDRnqyqQE?=
 =?us-ascii?Q?83+oWyxpkgMeXRa/XZG09T0T+ZjmpLldvfy5KVyLOfHY91/wXI0gJQmAnp09?=
 =?us-ascii?Q?0UfXea6r7oZeP38ZnBERigQJ5eH610SH76ofwuwhLKP7aS8TXkCRjchj6bYB?=
 =?us-ascii?Q?drhcMalktZ9bdLa6T1JgoC0ZtIgOUOkBzNdCvXlCxqzSGpWYFIr8EZbaSIB2?=
 =?us-ascii?Q?Xvl3XMxH07UpM2tAuWQYnIk0Pr9iX5Mj3CXKAS74JnX1QaC7fgpSyJAeIE6w?=
 =?us-ascii?Q?Gi8G5aZ1qWV0L2/qZEdNqk2SSF/bvUcMnejqMO8tzpOrzSwvlwJ+3J/uHZcm?=
 =?us-ascii?Q?oJSSVf0uL5nzkseqklPl6CQOIhBEopIwgaHR/I9onWsIt29BNzHLc9GKaF0q?=
 =?us-ascii?Q?aVqjVVK5kAQQF/N5hSmK4I8cpInUdj8y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9MqAcmf2fNJfO3FrBJofERTf0p8ImXI3d0nc+4q36dhRuPzgwjreSHDbYAWD?=
 =?us-ascii?Q?iH0xu/E8jEKtaUIltbiSnvcTlK2hp00+iJa/SLQBIR1L5vzrCn3rRVFYq0K9?=
 =?us-ascii?Q?PyJ2pfE2vfbFTNHlkgU++xAjoJruUIVYJEZjIQlpxQFOuGeOhGNWJQvM+eMn?=
 =?us-ascii?Q?A/Dye07pVpswSncpdmm3uHWMIiGBMnn9CBa8eOU4j0mvGiq219qIhZGGJO0i?=
 =?us-ascii?Q?rBRx+LWw0z/rWgBUkDdYUS7cCf0lh0f3VPnuQEPq1pCpf3Wjcj4HMY41p+On?=
 =?us-ascii?Q?bD8IzhICUzvEPXeUcMiMWFzwbYxeDs+/LDeP/PppTl8ZNCk9NLYiUE1kNRyy?=
 =?us-ascii?Q?Bf/dZTyzgxaKM7PwgprkpyRMHZY8kv7Sgwx9MQkCYf1t8CYvrQB3q52wQRov?=
 =?us-ascii?Q?A6KVxjuxj7lWlKVaSSE0RiB5NVPYRJE1FfgeQ9SMQB8K20azmMYl4ARVAvZ8?=
 =?us-ascii?Q?LeF4P+ji68zK0T1fZmX0DmIIi22JBLz6kVzvIt0wF9MyvvnTPRvvQXnO6aQZ?=
 =?us-ascii?Q?1gEh3kvxUQ1Ar9JPPvaT6bozQd5qpBI8M9cphVdRpz+BpqXYsKwPE+F4Uwt4?=
 =?us-ascii?Q?WsBNjpgT/seIID4sJZd9NhFdfaQCtUQFcwxuh75ddrNw6KOzdgl5zq8SY9ba?=
 =?us-ascii?Q?IdlVJbQkcc7aWJd5ftXpXZeeO0SqLKUPqL8qCiwcbnVLpNkTZKqUkmgl9kMQ?=
 =?us-ascii?Q?dpaRqBmt4ojwGhsqKT86HPDSxVGkLVn5DkYwCcgN9qwjElR6kpVat82kmzmh?=
 =?us-ascii?Q?FthXAxSGx4OVU8lpWdEayi0UouzE4JN0DvD34L4iXSocsvw5al1oRphDtWJr?=
 =?us-ascii?Q?3mjcGCU57Lg5kG+/5Gf4QDxu5VPoFXh6V+cLKr/C1SFJ0XXGsiWaSnpBnuKX?=
 =?us-ascii?Q?zjAy3OMV8yzdier7+xb4cxslU2FzueiZjob4sDzEqD6vL1TB877aoX1g7Y9V?=
 =?us-ascii?Q?+/0YVNUL/89fGs1QU6VKF+Y1b0qwXhu6BKd7vFSHLnZocutBPiXZyaq7p6tE?=
 =?us-ascii?Q?2AODOrT0IgUZGHgrVfQggxURkz9xbaupb7Ob7OGhoQQNuSIYoBs6t+osZQKF?=
 =?us-ascii?Q?Zth1aNc4IRFCKjk84qvcP1HqUJ/Fz/+0hXUbZravFQSSdyIxsi3cz0YQcp+L?=
 =?us-ascii?Q?Xak+C85YhJEM+KaFhvar3UPwn7oNpTUMzjz+zU1vweLQ3VTHSFQ3IeFdpcrU?=
 =?us-ascii?Q?nXnHjvwrq59i+xUNSfzbmvEaKj6Fn6JoYhaq/m0iPbgkYUT+CxF0AjU6ObUw?=
 =?us-ascii?Q?aDW7j/Rmsd1SuTk+8w+wmwmPf5nvtpzwRcLGMseiR0J6V8E+CM9KMcRyW/NC?=
 =?us-ascii?Q?YXfEoeL9sIV3ejzZIkHbOa2JXu2G1H1yLNV5HLL+zdji3Ez10IQvSSa87TOx?=
 =?us-ascii?Q?LxEvx6M1iKCNVCFDOpPe+CHU/q7CACHBj4MSAfOI81B+cyG+YcdI9OWcFp+l?=
 =?us-ascii?Q?s1hfjPjK/wu/NoxF7BqB3uKjJ09F7n3Dn9+BbMSHpjkYD6yjqTsF5Zt0xuti?=
 =?us-ascii?Q?a82ugejn6VmOLw3fKMuC1GV8cf3mjymRMO+vlS9j0Hib7WOYBZWj7FukjtE/?=
 =?us-ascii?Q?4NE93I3iy+CWK9944+y6rRCFErRq3ubJWLUqaZy9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zLEVzv6qZfz63wOM3hD1Xc1UuSK8UEQsbTRr5qqX+qI94v0jxKIEg82RBV88dtcZWr2w7Ba9mv6RtGliEe8Qa+LswN6PsUJZE5pwHKIHiIl/6qMJcV6MNoBa3a9Y2L2miK98Y6b01GJqkDlNN6OyMpSlwivzM0SQNCtVFqK8XuiruSraU1OhrdfP8bRkLxAAUmbnarxSdsXpMR4fRZeaiNMQGiTGjN2+0x7zz4G6qTl8cNGnoKXqqAiCjofAYt7NX71mZKYDsD96MlC/fLH83VVShUUhuOEChd7eK4QJKwnjdvXg1E3XGA//zfyY254JNWfKzAMlNQ/6e+QXbnKmZZyM7Q28D75p1fKK7gInjzQrk800vDFaZIT8Yj3C9B3hTHv3xc3YJcLM7W2e50doewGPe4ktr8IUKr2ED9rQt440sfN/XwmnJ3AZlHUT/xsvZ6rTceKiif4ju4qZDjjU5FrrOXRAxQzq0qFwucTo1KHMSfmI5vUsGHDX6Ob2PLKINBmDwg93QXIEkv8vUn1LbMvoevVLfhcYb+ldgUyrFTEJd54cHzoskGViLJYACqmEcfHCspMxvYq/bzzHAjYKp+wxgJuMhEFOfdzDezohckI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2e76e3-0b69-4aff-f245-08de13fb31e3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 19:17:53.0469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0i6Y3bhKRb5mIwAZtHR5VVWB1YdVKB1jLCRLWQbeE3LjmY8rMwAstblBkZETqJOMgsI3tnbQNsS3xOichn/Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510250176
X-Proofpoint-ORIG-GUID: 868V7W5BufqDMPaKe6WKFKIpwNdbU7AZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxNCBTYWx0ZWRfX9ZtCosyivGym
 RuNB96CbTRSCb57uuukgZLBWoznsG+HuZYmqo+LSIl1F6uaN0/Fgmz4+dXkLKQKAyVXIpToXS6s
 Bf9m0PQ0uhjUctUUIELwULiUwAq+mJjdWmQ/EluBTTFJmSGNQhMwtQCbAifqx/2l1+3Mryg+A2l
 MzwpMmXqvJ0tTAFhcGJfY109/c7GZEQRAgbdVjNy7Ud6IXTImY6gAkdgtHdPki4lvtPINUbYKQd
 eOMU9XOEXsK2ih+no5fQcPQN+uMM9h2aFUBkqfXNFi4KgDKvkjnlbetfriImbghEDw5hcgjPJpp
 kGLKymj8ZKcH/EADNH5Jnmhla5Q/Uruvq0sn/ICoXPV/Rlbre9wLZgIholrS0Vd3G+1Q5XmiI3U
 BARG4b4mpyVpmIqERDUXpqnA+0Drsw==
X-Proofpoint-GUID: 868V7W5BufqDMPaKe6WKFKIpwNdbU7AZ
X-Authority-Analysis: v=2.4 cv=TNdIilla c=1 sm=1 tr=0 ts=68fd2265 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=vt5GskqckJZp_Tr3LW4A:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtrace.spec | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/dtrace.spec b/dtrace.spec
index c0183cb5f..a4f3ed774 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -242,8 +242,10 @@ systemctl start dtprobed || :
 - Error injection via return() action.  (Kris Van Hees)
 - Improved string handling.  (Kris Van Hees)
 - Various bug fixes.  (Eugene Loh, Kris Van Hees)
+  [Orabug: 37994729, 38249511]
 - Various testsuite fixes and improvements.
   (Nick Alcock, Eugene Loh, Alan Maguire, Kris Van Hees)
+  [Orabug: 28763074, 37459289]
 
 * Tue Jun 10 2025 Kris Van Hees <kris.van.hees@oracle.com> - 2.0.3-1
 - This is only released on OL10.
@@ -334,7 +336,7 @@ systemctl start dtprobed || :
 - Fix dtprobed to support DOF that exceeds 64KiB. (Nick Alcock)
   [Orabug: 35411920]
 - Do not modify input files with dtrace -G if unchanged. (Steven Sistare)
-  [Orbug: 35417184]
+  [Orabug: 35417184]
 - Various testsuite fixes and improvements.
   (Nick Alcock, Eugene Loh, Kris Van Hees) [Orabug: 35435195]
 - Various code improvements.  (Nick Alcock, Eugene Loh, Kris Van Hees)
-- 
2.47.3

