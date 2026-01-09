Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5826B0B3
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576427; cv=fail; b=gNHZBj19HcdO3gigPVWW1JEUoy7sOvhlwpZpK9ST+c+Awkhqb3Y6xyUBqBid6QxsF8zi1w5Q1onf9yKpcXYn/57YHpbO/oj/jv6WqVUwyVFS8W+4pmrImGAdlJCgh2tTECZOXzPAA9Tn3CeyeMLGUswew84Pgfx85+spiJ1MSJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576427; c=relaxed/simple;
	bh=UY9T+rBPY/pb80domwmz20eT29CSNzHpwE3MR0cvoKo=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=uenGWbF5PpwlKczeDauBK5oU9Ha3KB/qN7mHJBZx1jWsu8PaI1lGHiFgrpSzzkffHpWYaJOUTUPAh4HHNFWRuWz9WE2qJuKA1REyKchZTZppwdCVXeB8KyXNh6pBVwTYMNfMGcqRpvhUIvcWQ9gQt/QTZwH1zhUr6zyyx5R76qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z6axORs9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lp/b1Nkl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z6axORs9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lp/b1Nkl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDo4Y51817752
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rUlacu7GcspHu8+K2nQBuLUIYr371FLxJv0VQg01QsA=; b=
	Z6axORs9/RgBCcrjeizpTpn7R5tHD1vy1smpfCcJ8hwfd/Veagb4bT5Jg3lpyK8l
	IbqOxY5wNVMKmyd87GO93mrMtPxWuHOrp0ktvIX1spksXodqZDKKzZkzf5KMsjhC
	+tuG8+FojNu2z7VaCeEOqesxnH4hyzMMZsmHF6687qPd93fIyr3JHA+8I+UfT8Un
	Agos114Sfj2jOXdj7DtqYp54a8pQqXyOnQiRkIl9aFSgmVWVDn1qCPXAYz8WLuuf
	IdA9RnhOPKgf9HIYikr5c8W+9cS9esQSHtQ95R5EwdrpBdWfFkuooTf537volwH1
	S6Oz8WUMnQLDvnATcg/1xQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp59vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:13:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GEXeMh004204
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:13:44 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7pt355-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEfdzOrpYS8oVPtXMIkp9ThG8r1QV4JHFYjfVYR7gRaaQOchOhb9pX/woUSAImQVk7AnrD5z05YS7dSyrOyOkxIPAJcKWP7YkJZGyGfYQiKJq482Tbh2pelpdIodEuW3A5WXlVitIj8SIfuz+OY1JqSzMY3xf5sExLKyWv3SCN6tkByO3fnfM4qNcqhDjV1N7Vdbx5IfyobXIAAwBDE8XC00acXWB8vq0FTX7wlcdV0K8uBjNCxKqChbXPT+g7okeJ5ozaNNqeNNfH2qhBUUIjIZSoq8hzxSjyWspagwhwxx95PU2PE5y3D+F5lP2iWA7dqjincDzYAE+wlgTFOgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUlacu7GcspHu8+K2nQBuLUIYr371FLxJv0VQg01QsA=;
 b=PB3vZYNJUXTuEag3NptGTlhGKa6c30STKmFUwpt9d7HgNInoH7A8d6POBejTebt/WYbdPxy/DN6GxpE87w2CzKlaccQs4sto69fnFrYtgYjKAybK8VV/cv0fjKAxpJdK/hz+FD8kJhwjDSOrjAMYm+9q8omJHqc1lCA7GHvY6GkGgcd3oA/2FlHmUJPF19Ml8UdSn8xOR5JNmeWKwE0G1B648M4JALMwcegTR06JIBjuQkNN2C5P8nUY41BtuYvibldg/IZp/ZiIpot1v+UkeeQwyAQPuymr3caFRIcf04DAjUk7kqhhzMGGiMbPz5q1a0/fr+6klzL6dtbSMrTXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUlacu7GcspHu8+K2nQBuLUIYr371FLxJv0VQg01QsA=;
 b=Lp/b1NklpFEdoA6jNK6ay0/u8VpTmNXw+18LQSjqn1wF4D8sfvpXanoKkjKrs26u9t+H716kPmlkoMe7PM4hv4TNWy395EtfbrfaFuRVbS2YonRv2b1MaNVd9fXns+A+nERLMDYoAX6ydf0gGB2xgZt/311bOCc0zQpjbgRK86E=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6033.namprd10.prod.outlook.com (2603:10b6:510:1ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 15:13:40 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 15:13:40 +0000
Message-ID: <b69b05db272a70bc46cc5e64ea1951c2@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Fri, 9 Jan 2026 16:10:50 -0500
Subject: [PATCH] bpf: use initializer for dtrace_difo_t *dp
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:510:174::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8981b566-816f-4e4c-923d-08de5511d4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L5Ct+p1I/uR8kCUywWDCt1+cAZWnwzVF+AIm20BYXzl/1M/WqMV//pW4TQmS?=
 =?us-ascii?Q?zDoDYwXsX0FlkEytgIOijIfAdgeX2lRgAKKbGGpiYmvnx0VxyUgFrIGp/1pM?=
 =?us-ascii?Q?6mvlx3BUyZT0+JfVz+GcSpEdEoiyzH0n2jBkmMPIy6nGHiKkcFWcOsIF4Xd0?=
 =?us-ascii?Q?TyXCXHcP9qPRNI+M8YgOroBvYElBHoVv8s/gNVhPstgtUu1NgrLcP2gZyMGy?=
 =?us-ascii?Q?Ej2qiHftsj07S0ncgrr3ivfTYMS9mGbBoLLvVjQ2/fCrBYJrDThOTDOFHAHy?=
 =?us-ascii?Q?J+GSWMZSRf+QHgiwQbOGBgs6y5P3CNJOcT7jqGRpjUzV8Nb3tAxNL9xpH9UD?=
 =?us-ascii?Q?8lLKx9Q3JySqUVhlmCjVXmO77s5gzt3tSwy0Dt5llALQsILkshC4vZn9SZVv?=
 =?us-ascii?Q?LhHrPlpBsLk6Cm0kbs5r7T88b90V0pJ2YAJ00f79BWq8T6Gzz2JTeZnRipC0?=
 =?us-ascii?Q?XwnDYT3QhtNbPslmANlesDpl8qKzDU6mQL2Mky5uyZHBoyTp6C3OpCPq6WCd?=
 =?us-ascii?Q?/MyJICJ20P801ZDcUQVqePmkb4QEft/nEC2alOY3vJBQLpCyB+Ez+awyFE2U?=
 =?us-ascii?Q?fVH2oajQMKge2/uWUtBb5dVH7oGwXuhApXoWbvzCxfSph+ewiZnJnJt+8nS1?=
 =?us-ascii?Q?Pck6cX/4pHk6WZmZxeg0e3K9yHrvC3nAKVl8NIQdwOvhWC23ryWEIk2K6Cjn?=
 =?us-ascii?Q?ijq+uH/648UKdGhjoQf41HY8rtSq8me64dLYNRq770Y/kVSrZrSEo/qwIvfV?=
 =?us-ascii?Q?Ll1DxKlXplInMniGkCBKolj3tKOuvO6ai4Xm5BZJCKZig7wQhXexdExTlMDr?=
 =?us-ascii?Q?tL+DkeQzudVCa8zsUJnMEFU+n1MZm23VVNI/cOC54pP61/VuaWvins/CBxc0?=
 =?us-ascii?Q?5XWnHbhvdtxxXBBfR/b8tr9SUZJ60GCqK5Q4o6CumxGyHUUyaeS91Xtc3niy?=
 =?us-ascii?Q?sE2LnlrGY9ISO9saqd5aaRDPGVjwn0PAlDYD9fg+9j34XDOsiarhyo3yozjx?=
 =?us-ascii?Q?eyzXgu3z+VvpvLE2oLlvz1/ycgjWB2otxrgKSd/LGZFKkMKIbVQVwVqjB7wG?=
 =?us-ascii?Q?iDbdMDdJz2i2WB5jmFjO4oe5usPgZ/fAzzAoXKxTudTKX/Y2nFzOUWiGTWdg?=
 =?us-ascii?Q?5t73tOdm3PMq5WzdYYdgj4JuabvBYiMabVS/x7dyA30DvoEDJFPrZIEwMN+X?=
 =?us-ascii?Q?R3tPE174m+bz0yy1KPk1JtszgW00lwNlWt4FYvlJbagPxmagtGoAoipH6CuQ?=
 =?us-ascii?Q?NgxaWzWSK4yqIy8dwzaa9WQRdSxzzQl07hosvlxoSnBfoEtVsVVO4pf43s/c?=
 =?us-ascii?Q?0auPVxeUiBG9+79kxMw5lfIwj54fUJVmV9mBC40xWRJPABjOFJbg7PnToMb2?=
 =?us-ascii?Q?ALqMHCNZBnRp9m1Pver6m+K1YEdBF1xBXsFPloyHZq0K+X9Mfp65U16Nit/j?=
 =?us-ascii?Q?2tnm+CTQSoNv40Z8gjmUPA6OnJcadbBhRbkENtFkJFy6rhPgf3H6+zeMvmle?=
 =?us-ascii?Q?W6LcvxaowRxUJQFnsxw84GawKeTSIxgL/9ozgGqzHQoiXYtsur/xsT8ORKo+?=
 =?us-ascii?Q?XyBgUg79xB6rpN5CBVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pb9+D8HSXSNGMOZLrWSH3pRsod/YCjnaY29FiQsXmwd6ntsDia/7waLdDxs+?=
 =?us-ascii?Q?SQT1s1fhs/kGVEa8w87Bb9v3WoOJd3v0YI2hbAR7QtLq1zTW39BshW+vXN/y?=
 =?us-ascii?Q?cBdTIaCGuRNNfHRimNra3D30M4kkigD+jayEv4RUw6owyZ6kzwkhgJikfmtW?=
 =?us-ascii?Q?tqu0tFlTZ6i+5xfkIHGvHffEvLx/4mr1jzP4tu/xot5nxtlcWr8jkN9BuI6+?=
 =?us-ascii?Q?AdD3CVD5X42MQYLPBFlA0328gS5fFp9DJ2E9BCuvUeDfpQoqZPW832TXD34G?=
 =?us-ascii?Q?ib+INZ7f+PpGLoVpRQGy2aoLzvGRxtwI1WGxx0RcMLPw5S1SlBDTEBAcQ8HV?=
 =?us-ascii?Q?QgRC0zevVUg5GU1Ll4+Nt4KcSLB7yYQhSkkNgeJLViYrqD4QBIFYWFzE4r2D?=
 =?us-ascii?Q?RelP83klPAeRxEeZm1q+vz1RsiJqDfiCk8vZjNtWuoKvQryHOwsBN7cfG3v6?=
 =?us-ascii?Q?nuYvKV+6Uk6hNRvBagYZInzr4auOhifnVXX/I/KC5594CK+7ZzQ6sHlyadUG?=
 =?us-ascii?Q?IAqEudZZOJWvk2yJjggurWlnWR+OHuHCxTKQdJKM0vpuO7shIPpvOFP+igdO?=
 =?us-ascii?Q?KitSjMURSPIilTkg+XId2hx0H3LVdz7KlinRaY+SmoyMi491jMJIkFaokzth?=
 =?us-ascii?Q?E8EIedyeH6b2gK9p/0e7YoNYGbTBhQCROroKZsvxDG/i+hLkWOYt8g0PT6q5?=
 =?us-ascii?Q?W+mjKbWgnZo1jCtDwszQyaI51zj2HmuhWj03aHUHdwxIY5NjlvSzg7pFLO3T?=
 =?us-ascii?Q?tRxELHKIsi4N1FLtDGVqcA0lQijyD11gk8lp2gacOC1D1w73X7bmt8aRBcik?=
 =?us-ascii?Q?fL2eERXaeokbP7e7BEhGTeN/ALbDO80+UPe1IHYDnU83Znz/6iXgri7d+M5o?=
 =?us-ascii?Q?T84L0Y/J1SH4zub3HfNCJs3eOBOWfHznfTHRPyzlSt8PivpbnRi6gsDo6/rm?=
 =?us-ascii?Q?HfCfEF9WBSTWUG1WuckbEkbwUkB6t71yt6bqbbzaCOXJfEnRLeNB340EsV/p?=
 =?us-ascii?Q?w8v03JiMFXyvYEShY4uOc2rmW3nCR9p/sGoAKx0mjhA1SYol0RY61Y3h/oS4?=
 =?us-ascii?Q?7j8irydeiA8uN3GYuX5rFk20fCsPK92xnjXVk5a4DgSyeXvWFR7sxLFhUVMW?=
 =?us-ascii?Q?5t5eKb4YIpyzQBiiGK5Z2rI00H4CkW7oRcEI3E+sBT/oxc2JR70p4/mmEgsw?=
 =?us-ascii?Q?BaEDLSZ+Hrd5mOddm+2OUgjD8oO/FJVrq4knOD7PVJMH1MtPV+bBnXTycx0Z?=
 =?us-ascii?Q?xrO3qXh4SFQeAs39nXe8J3KmmdYGWilq4Y1ImAtIpyu0p58bdq9lXe5QJtJn?=
 =?us-ascii?Q?H21YYSWYaCPuqhneK6/0zpQ78C+UfkeMMJYPhNa0j4BrUfT/SaV6W0f3AtZo?=
 =?us-ascii?Q?GyodH0IGTLaSFmvKOQIJ940zcj/JfhIaimiw0QEc5GG/lrvvsdG1gyAi7c09?=
 =?us-ascii?Q?E34ZtnLDgMyEK3IPjcN9AFDKaDbcPpazttFH2D9DKYcLymlDIDhnqgAw1g+0?=
 =?us-ascii?Q?bizTYZVQcgGcYVWbxgMGNkAIRP1Evay3/1wRu1tXGQROY6o2zk/XILrD1rra?=
 =?us-ascii?Q?S1NXoEZiJfkppsgFy3D69tg5rSEXml1P6JNguF0K38a76u9A+N9SOHQRdduA?=
 =?us-ascii?Q?qLjLTwTj7IIctF4QtXtBzAZ1ENUHhbp7363NUagXfMj5RuJEIFKxuj9y7HTO?=
 =?us-ascii?Q?OgHNrizCVxeLjUAwRMIO7Z4LXEou5d2aMAITl6zKN8IGYejAwVnEb4fklepP?=
 =?us-ascii?Q?QaPSYqrGzJl7Jo1cpNL6lvsT0vCVTJo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gslfi+lsYRpASEFOZiZ0igTelV10aexoSMDO4CKxdoHeb6MoV4lBN9f3ROYMWIkQOXRGROc2ExAB405fOhFhbyt8NW2MqRqbA7228D94SxD9904gEVnh/GACx8bNDDpHtU/4pOIkSiOYm7f7xbZNAfSXK7H7e0D6UFXileFYTs2VGyCfxsFMD3pSjiVb90vxSKwr5jNmGpnKFjHclCJarASjiyRUrxNXBFInZEP7xiUumKKcSDgRIo3jCksM/p+2fRFU4Z+35VmfMLrd0R1bcWKa1wisRLMBlZ1JTyxlO6fYMzZWzEWo8SW+xbaY6jDsOvqMK5PLJ623mUoCxDyN4E/VzdM26VrQJ0xhp6Fz4XIUUG/g/rQEUkJEnBa+mUMmZIsM3spkjHq6uORKcIV0AZGrPPV6bBcxuMahc6vaPJLdEliyTjD8/PQySAAN2exvKKdOflrjqWeH/8o0gNL0MA3TPfH09Mv6bMIB+6UzoETSIP6Lu8TpoMbdfEhelLawU13R4yeqp4wBBAkykaSxbUvqXF1+Rb2lZMfigOHIvuf2exi0iDQBe/0RgZWArHDwiI+fSWsHqXWZ9vMnKdAE4QIlakeiX9iTlZelvi4DPwA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8981b566-816f-4e4c-923d-08de5511d4a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:13:40.4714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd9L9Y+zEmlthNxnoys/UH6fLQ4KPaDaDaI9izZARD0RFo0su6pvVA02x/Rn1/Sx86o8QPSHwaE02X085IHfZYn5LPPbUv2rIdTt6Po59fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6033
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=809 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOCBTYWx0ZWRfX3eiTydqTVABy
 wXdliGrOBAm/yLWBwiUdLhUHjoJyJJNMec9N4fPtIXxACc9pNH7NsONoH6Ty2XkbIswFJ5Pju+j
 md+r4nMg68/xdUk3VacRhmUTOcs1JfKwQ9pnYjNvDnILCqPSYHidYrUpVANKLcuLaJ8tV43uTdD
 jm9lEyB9HQG1FB0gC2Za8pzFbpA3+2zeZlQVEtgifmID5nedIP4GNGjgXVV2iq92aln0xr09qFs
 Yt4YHmXOH1ehBavwXJf4ITzAd43LsU9CxB2wnzoDQFEUN7R1raK4zPXdkNzSLGYuPJgq52S83l6
 naOFbZFcIDk9J86Rqk/d+IHPs60oudzbUQSpmaykN0M8q2JPzSpT/5oihqHJnt6416vOvekZyas
 g6uQNg6auJB/LF6VA9RpG4YOcK1qziCBfDQ0qCp+c5rf+ob6rt8AK0YCpJpjFj/IhKRgcmsZBCF
 2dwuCZjqhXMuSO4K1C40bKjvxBXQHPZzylEswr4s=
X-Proofpoint-GUID: zXFYNAxbfm0heoLWQb1sN2Zkuxjrn059
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=696a55a9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=4aeXkrClUukx0_oRSqAA:9 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: zXFYNAxbfm0heoLWQb1sN2Zkuxjrn059

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 82a73414..20365855 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -422,12 +422,9 @@ have_helper(uint32_t func_id)
 				BPF_CALL_HELPER(func_id),
 				BPF_RETURN()
 			};
-	dtrace_difo_t	dp;
+	dtrace_difo_t	dp = { insns, NULL, NULL, ARRAY_SIZE(insns) };
 	int		fd;
 
-	dp.dtdo_buf = insns;
-	dp.dtdo_len = ARRAY_SIZE(insns);
-
 	/* If the program loads, we can use the helper. */
 	fd = dt_bpf_prog_attach(BPF_PROG_TYPE_KPROBE, 0, 0, 0, &dp,
 			      1, log, DT_BPF_LOG_SIZE_SMALL);
@@ -486,12 +483,9 @@ have_attach_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
 				BPF_MOV_IMM(BPF_REG_0, 0),
 				BPF_RETURN()
 			};
-	dtrace_difo_t	dp;
+	dtrace_difo_t	dp = { insns, NULL, NULL, ARRAY_SIZE(insns) };
 	int		pfd, tfd = -1;
 
-	dp.dtdo_buf = insns;
-	dp.dtdo_len = ARRAY_SIZE(insns);
-
 	pfd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
 	/* If the program load fails, we cannot iuse the attach type. */
 	if (pfd < 0)
-- 
2.51.0

