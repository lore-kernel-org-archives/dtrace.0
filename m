Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC4C1A275
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752558508; cv=fail; b=tyk/8tbol9RbQ8l/utv+Kk3rgbNG21XT+6OzzHqQo0QS1q+RrrJOM0olVVpNOVisixNiS0SBRihxkWnCRLwUFIuhFXX9KcAAeKKyB3c2nuJYoGG1ZXHkHKcq+1B0moJ2colr07cJU8VO6kT84ADWmyNz8cvNcNaFi6AEKcxZxgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752558508; c=relaxed/simple;
	bh=cxmr4+V0L3oOmPerUS2E8Rpck0gJnECC5hrR2+UFshA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=YjUNncgdC+UqCgZH+TE0tA7Tnc0+I4GnnQ3Q2F8Sv5FBhw3dK8W2a8QzvEN/gIQM5cHdp+YIm4U0qJTzwqUj+67t5fFo9pzjQmq+tt/i5t9UB/RqvOUfdSKEw7Q3cR0YV2lf9//L9kwAoWHFA35Uy5IdNidkhqvyXzcZAkIR6MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KK0jRI0n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uzWsN3xJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KK0jRI0n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uzWsN3xJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F1Yo3x027909
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0gCtG9Tcf2//wCa7w9LQskmGmszm2yMCxiV0Stq2B2A=; b=
	KK0jRI0noREVmGFIyuB8Sdqh3fxCocSqFPuQL+hM/YwusM9yZcKK3vj2wj7xuviL
	RdOlPcE+ux68I4432N779sofitqdSoTxVPmDJ2P1clJ2jGxeHcKVlFqDYqSjPUU6
	3jjxAeje4LnlHdQdLzZVrK6hXyffifPdwxpwi/dphjegjgGCPvC8EqiWfNgbzZaz
	qIZ5nxJz5z+pv4KZwGN+5I5XDxejp4gsjpFsefuN6m6eqVhpy4Ck6jTxyXRckmMv
	JdSahask3z+NTCcol/ImWqnVPvR5kNv27LesabkbCUHOU7WJE+VWFxfVR+g5pfQK
	RzrdMUdXHuByQg6wSdTAqA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhjf6ae9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F47uEW029002
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:24 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5985mw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 05:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRk2wc6ID0N6Bt+oKJ0hhAfcRt5kVbFaXtBX1NitigP0Xa9ZLlcAA0CEHnxMSB37JGzivte92ZxRRpRgn7pZEunKAUlOI07TAOZDLpniqTPG9EWOwbvekfRRzbq8HWsxger1Xug1UxVH0uyGPXWg3cewcrPVSd4NyTqV73Rmn+UsLJKVWy+gZnRBltAEKicN5iuD3FVFJIDlpyBrX1nCHnP84OnjoJ/ta5WLRJk7RXfwjButJcVWUNlBr+dn0rI7+QVFpMCxyNp/5RxQvVF7pW9dwhHrLshRQ8zXfkeSEINVEmucTpzu8xGCkNByJ7lfSAGnvooMNKYN1dC+pKrqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gCtG9Tcf2//wCa7w9LQskmGmszm2yMCxiV0Stq2B2A=;
 b=KLemBVE2TxdjSCjdt9dMt5k39h1GtGbQYlU6bYxjod7yUFowcLDlvfCIgau6doby7P7xUNveGnig8zdPLb6OPmttS05EO6Dc/p6t6drhZM+ALTTocVqTM7nnEUFqN1xQeBWeYViLFFhJRxhGnDNk1/5lrQJSi7ItCa7yEiabF5AkK5x1NiMHWpOH+15xGHEQ1IqhGK0qrRc8yVatVUVzh3EHF/gpkXsBvFd8b0+KQMe1TmhOvqcHUGtS83CrPYJGsKmz1ekndPvTF9FusvMEKF5wb7bxVU6jVUma1ygdpgsclXwbbYay2XvF+54dJ8+P1wZDvpt/EwO+kwAccAdklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gCtG9Tcf2//wCa7w9LQskmGmszm2yMCxiV0Stq2B2A=;
 b=uzWsN3xJFFCzuMdrY8RIuMTwwr0y8TfExxVfRyHa5LYxuky2/5lK+lM2x1zQdKpia3G5qUVphcReU9Sdztn+4dU0t5LmTp7CekomXCOcB/5qT2zYg7LpptH0954jZo3x1Tl3d4RjuP0gEFpwxqyzJ8r5vnF0ujRtKGZpQOVHVOk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 05:48:12 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 15 Jul 2025
 05:48:12 +0000
Date: Tue, 15 Jul 2025 01:48:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] provider, cg: add reject_clasue() callback
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8266c1-5f26-421b-18fa-08ddc3632f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SugmZXYXhkHjxquGSvJE99c8LjRloV3PVqgpBIVL0P3BRueenRM7+ju3N5MU?=
 =?us-ascii?Q?B5BqQp5ACLDGozcPksFvf84MJhH5YJljMzkeuH23bnBqjHqjRpi9uFdeLoLY?=
 =?us-ascii?Q?TWKoQSkWXi9/oguyVsghgO9Wn6ceytff3fYp3vzDh8vM/iG5kdnewhxkUWd8?=
 =?us-ascii?Q?qZbKPxwC2PMZKClGEVYLEMYYrv5xg68cw6js4lDbb+jBh8KE/12ffTZtYxEn?=
 =?us-ascii?Q?aHZn0iGQ858XRRirHI+T0gI8z0Pm2ccGMwHjpVUHVDBtJTW0XKSvaqO3KrvE?=
 =?us-ascii?Q?O6x1E92ydaOMu1NK+DH/I0cJzPRL1hDH1yses/5Gw0H1ECHTDxOALO1SDm6r?=
 =?us-ascii?Q?aN8FCiO7LzXSdN/Bbd4DZ7G66ItaZ1YEirl/PCMO0SyBV2jKbbDWtxB2wYDn?=
 =?us-ascii?Q?/gvzdlN0am7hCKCGqsIv9V3PQ90tBghqdhqwdPPpC/aMwqQpJz0In7jhYKgQ?=
 =?us-ascii?Q?WAHn4UC6ai6M8KFHIZnhjZuMZObriQsKz2RWYpOY9OhwIZScNuFmGby2EK9k?=
 =?us-ascii?Q?dZTG5hWMY3KQa9e2VHPzYAzrs6vpySKSrcP7uo8brC7aEwaXcTZSgmQfqjyM?=
 =?us-ascii?Q?BIXYIl622Lh8FcnxFm7cRMHK/UNlOEcH0a726ymzgBDYZJV1JfrBpdYKSc58?=
 =?us-ascii?Q?9jkkzEGujbQKL8XuBo8bnAwzwSfKLjhWZBk1/zbtoMI8PBRY7FpJUecjep5g?=
 =?us-ascii?Q?zuwBX1RR6kQGZjC1PX1cIsCAcRUBzcj5nfY3CbKVUAfwP4ZuOSDLbJFNM2tv?=
 =?us-ascii?Q?KfcV0VOgy+8Prb7Ik2iDl2E0K58VjNl7t0yDps4JR84/887hEH/rkeHUVRBN?=
 =?us-ascii?Q?xXPa7ERudp4ldwtvwPoHLmEMhf4SHkjUFLAKOkUHZZiQ5DNpK/bIqwG+VPKk?=
 =?us-ascii?Q?nj+Tk8d59GWpleY40F+xgljntNVrt9ViSjhudmrO8XLHSsrH7jWB6jEkDmIA?=
 =?us-ascii?Q?AMKI9G8s2uVZIvDuyzm5IeIam3Aowx8pNjQkED58EluGmispD4v3DAjJUPH2?=
 =?us-ascii?Q?a5z8BdDeSVMPiRi848XW7jXqtFqCba7X9vyz6Tsi+wW81KaBLdP+YQZyfvdX?=
 =?us-ascii?Q?rKZ78rjVBPjBJoOyvtGdq2itDgOAdMIbrkeJ3peryVnCAAd3p42fjj3LJ7PU?=
 =?us-ascii?Q?eb2y7m5mBBRlJATQlIoztJp5CYtfd7FOwtIHLRX0MGFYA7K6zO3tACQQN/1L?=
 =?us-ascii?Q?gVxEeNiLsfVVQX9+8XFbmnJujnZYCbuesheYtBakWxA2wNCcVGKdRa+MIOJi?=
 =?us-ascii?Q?CbfiwKYGYI12Omvj/ubWpO88rHIs/fyErv7VPTgJzQbe2vVefJX5VsqHM8jr?=
 =?us-ascii?Q?jI8Jqc3yIEZho2oKFAabECXCk2eQLnRzhItwmaHbRxEaYbLATnzAK/oC6RZq?=
 =?us-ascii?Q?hnDdGn26CQP8JuTv8LAfPsnGarCacz56PmEVxSYSoB1RubY182za47XfBBH6?=
 =?us-ascii?Q?y+J3NQSxIa0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UYaPYWfQELs5sLRGv7NscpbO5qCEDnY48d/spJnpgrlsoMJjEAJun8F7Qk7j?=
 =?us-ascii?Q?gl3hYEkEgt9VxsQq3X8PT8BspgcJ3ClGTmaLBHfjiSRi0P3tv+po3fNkcz8U?=
 =?us-ascii?Q?XrGF5kc0uqkFymbr2myVrvXD/gYthFM6NBQlHepjRdYtYXJBTFPCS7/uGbB5?=
 =?us-ascii?Q?Yh0zhWHkSWgH53YGFqBCBHeCBoHY6kWzO0XljsYo917/BgB/Ze9KnffSuN6P?=
 =?us-ascii?Q?pOn0SWAoHLPu813yZZzAzKx+iXtAt0NYiiu7zy9+jJ0gkg0q2jxDRqNNMup4?=
 =?us-ascii?Q?gvn25l+xcP0UV9vQPk+lCSicp+6Qevj+Q74sKgaJdmi/zLdAKzF45qx6CQGZ?=
 =?us-ascii?Q?J0n1cu/pi9TzAuDqc9BN4qTCQVhtX5PFYUdM9obdV50/q9bObCCTtQHktBtc?=
 =?us-ascii?Q?oLuXMjx8KiQu+DKYpvjnub4Z4qg8Hizzsauf2BxHkHPh7VBe/r8aAsL3k7gt?=
 =?us-ascii?Q?fDy0GAJZdUrXVS7sFUVa3C/alY+B4aBD33yB/n4ONgZp9VUVsDpAP3MXu9nZ?=
 =?us-ascii?Q?PrwxFB/Zw47sZ+IDhVUsOzr/MLU0NO4JsnmzGKrtFoHYmqe8eQr/yIY/OVLJ?=
 =?us-ascii?Q?ywGv0yhuXOIplcpd5moV0pl3MI295KjESBEds9meMualnjToh9Hm8W6Mgn8x?=
 =?us-ascii?Q?TWorJM+3hYw/tXf3lc9VmE7zG6qsjdSHKxcrzj64pn4ZLRnWbak6UxVbDBmi?=
 =?us-ascii?Q?NFRmuyJhQNjH68fUgvjjdR9ZWpoJuX3e6l+B+WfeVJPkmQdR4IMyI48TDfBL?=
 =?us-ascii?Q?bALmEKAfO7J9PVjUGyC7txI2uBy2usDgdIPBupCHryOVxPY6/hUDloQ1pMmN?=
 =?us-ascii?Q?RCwnWTtQb1dhDxYbAJmk9fH7otO4qbTC/xmAMQfUadon1Z7A0dtLmWXu8tPl?=
 =?us-ascii?Q?RIUR6ltIGIqweqhmL7P/rCzZgc2lhQSmux0X3C1WA+JpWRcLOxTwWubWUPKh?=
 =?us-ascii?Q?VCnqc+4ekoLM10vYGO3qtuA8YelvRfZ4fmHAztI88YDQ06J97ceKz2rSHjO8?=
 =?us-ascii?Q?BbJEPAX0DLYHF268pR7exxlgpxhbaBClXISZbSp6E8K+vClQqPlkUJ+l2TPg?=
 =?us-ascii?Q?rUlED9YCq3oqEZeSWtHzVBOaNRti2IO3Vvb7g4OIrgkZhQBQX28bKp0P0a3F?=
 =?us-ascii?Q?D494eRhQTCyLLiI3aQPl5yRH8nuvV5p+bwDDkX9pIbQPiiYW2HF/k0VCGNdF?=
 =?us-ascii?Q?/y6GMEPCWJa0AJ1Avssg1TeJAVW+0oZsilhRkPObtRdk9o9u5T6vqR+UUSAX?=
 =?us-ascii?Q?16pGw5UCQgmIeJm0NNoQVL47vEd6P2BCH9xPpxrc80MsFPlmejtj+rJWVTqj?=
 =?us-ascii?Q?JsUGIcogNJwHOnKvtuMDxU0NU5ahnARnHZIFKTcwmVYxZbPl8SOi1T2Oliga?=
 =?us-ascii?Q?PQpDd3J9auD2hkrOT1JnGTwnK1RktZbMEL5C6MMef7LS6lID0DIOGbG8gxZ1?=
 =?us-ascii?Q?su5PX6hXD1tSkcE30eSOlsfpFsA8DB643/X6BOCIubQJej476Zb6Pm1g+9u2?=
 =?us-ascii?Q?0HSb4Vr2L09uvLGOTzRpaHKQhXaCPkF5k7w+ZFbnAAtUDWdhBK1UDhw/OGvQ?=
 =?us-ascii?Q?uSSzWZ2JP/SyezlmhQrSZa7rett9cCMXS560kAA4tV0ZCNT4kQXSefk/2Hzr?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UsQMUpDUDAC2ZPDwDaMpBjk/JuoNmAtDu0CbbvFuK1J3gxqpEF3RbK1kZ2pOX21XYLVkjF0B1ccjUvJkUVzVl2tSY93/4WE0V6R8NSEU2iQXVQ9jmijCuFuVflFIXp92M0ckMY0k6rPz5cXAiwmgTf9uj9IUr7apJCAphg2jmnsDDq/8XQxcZ6B3J4K7PPB+oLiNWz9UPTM0G/q3mfPIwBZxBzPU9mgbQ0YNCmZiuQa1sXCWoSFNSnwreMOdAsbxmIW1n7omlVwc/7Nw2siXlNUwDkc5/S/bYoSDpuqLxIAdCzWvITG7jOHLmQQzwNPb+fvnrlJVbe1xxSL813MI6cWzlAHlSDYReX4OdurVp8bpZuZNb/NM/xTxF/tGyMV9kscVDmSZ3we61Zo9VPjjgg0LxpGcWkOD5Hmr5xdUgV14lS36Jdwiniz4pQPu02dL5u3W+dBvbCiKIf/XRfnm/6hdbARfoJNj6vKqFpnlYyh3vB5EWQhaw2vAkqPqGSi4ZSFGdqe8EQaUj6xuiFzXx4UX9jfBgo49pBRYlOjn4xNnXiJbEM6VcrYLV+hVgXRJGEOVfn/XBP9gwH851ZmRIjIDNlHbPnFg2u0tZi8TFx8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8266c1-5f26-421b-18fa-08ddc3632f7f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 05:48:12.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYkADOvNMooc7OJ1sFQwWl+733LCzopaymsmQ7Y5NKDSNG/Ro0FvjX/Kvbumul4E+1QNbUb9UjW3KPi4J9HcXrcEqD0yIytzpVxvplG1Me4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150051
X-Proofpoint-GUID: Wr-NoBtzQBkaDUU9xup14XgIEZSqQJ3A
X-Authority-Analysis: v=2.4 cv=O6g5vA9W c=1 sm=1 tr=0 ts=6875eba9 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=0Hp_QZr0RyJyip95NUYA:9
X-Proofpoint-ORIG-GUID: Wr-NoBtzQBkaDUU9xup14XgIEZSqQJ3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA1MCBTYWx0ZWRfX2urMT0t3XM/P lC8HM0drmgsClJ26MCQNRcE2IzxnVfcWoUFo8pb8CA7fGlq4y11yBg4qCaVFbRjmvqCr569mVtN 5CMS2YQ/3zZ+uQw4sSUZGYiBkRehDOgiOogLG6K3Tr5bunLqZ1yCPWxpdBDsna6INIUHabr8BHQ
 Y04sgOxA2RuOjq2EgUNR9wgV8lhhbWBam6RdHxWrd5cWuxFPQr0sHuGUPfxDaCFMEbyrdN6wrzM YAtal7tYjFhp0tsNNoksL/bCQazYU2Oz9kqF4NGSNL5C4fHcdPccu4pz4nBc+X17yKERGWk/2u6 +RnfiqvGWTosA8u4mIGU81Kdm50rlg+yIDbKZqXzHjdp3lk5CORRc209NEXM9lgfkithACjvThO
 uxlL1v9uPXpsmc77YXvCKBMJQBE75L6DU6dTXIh8so4LYZG7PYRa7K2oWg1N5jeCFX7I5wGr

Future providers will require functionality to determine whether a
clause for one of its probes needs to be rejected for some reason.

Since the callback is invoked during trampoline creation, rejection
must result in a compilation error.  The callback is responsible for
this.  If it returns, the clause is accepted.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c       | 22 ++++++++++++++++------
 libdtrace/dt_provider.h |  2 ++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index d80b0a55..738597ed 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -855,16 +855,26 @@ dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
 }
 
 typedef struct {
-	dt_irlist_t	*dlp;
-	dt_activity_t	act;
-	uint_t		lbl_exit;
+	const dt_probe_t	*prp;
+	dt_irlist_t		*dlp;
+	dt_activity_t		act;
+	uint_t			lbl_exit;
 } dt_clause_arg_t;
 
 static int
 dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *arg)
 {
-	dt_irlist_t	*dlp = arg->dlp;
-	dt_ident_t	*idp = sdp->dtsd_clause;
+	const dt_probe_t	*prp = arg->prp;
+	dt_irlist_t		*dlp = arg->dlp;
+	dt_ident_t		*idp = sdp->dtsd_clause;
+
+	/*
+	 * Ensure the clause is valid for the probe.  Call the reject_clause()
+	 * hook if defined, otherwise apply default checks.  Rejection of the
+	 * clause must be reported as a compilation error.
+	 */
+	if (prp->prov->impl->reject_clause != NULL)
+		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
 
 	/*
 	 *	if (*dctx.act != act)	// ldw %r0, [%r9 + DCTX_ACT]
@@ -895,7 +905,7 @@ void
 dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp, dt_activity_t act)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	dt_clause_arg_t	arg = { dlp, act, pcb->pcb_exitlbl };
+	dt_clause_arg_t	arg = { prp, dlp, act, pcb->pcb_exitlbl };
 
 	dt_probe_stmt_iter(pcb->pcb_hdl, prp, (dt_stmt_f *)dt_cg_call_clause, &arg);
 }
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 2a3bba80..a7263f5d 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -52,6 +52,8 @@ typedef struct dt_provimpl {
 		       const pid_probespec_t *psp);
 	void (*enable)(dtrace_hdl_t *dtp,	/* enable the given probe */
 		       struct dt_probe *prp);
+	void (*reject_clause)(const struct dt_probe *prp, int clsflags);
+						/* check clause flags */
 	int (*trampoline)(dt_pcb_t *pcb,	/* generate BPF trampoline */
 			   uint_t exitlbl);
 	int (*load_prog)(dtrace_hdl_t *dtp, const struct dt_probe *prp,
-- 
2.43.5

