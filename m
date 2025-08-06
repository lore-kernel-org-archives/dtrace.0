Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F45CDF1
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754499461; cv=fail; b=HXqsWrX3PQSiArW+YGlYjWB+HjtbxcZGVETfi1ZfVwYz1F9kt3iys4Bxw9JpNfoTkQCNRigNOOt8rEGziukpNiZvCVRfkYfKKM4sLhRDKhM25I9/0PJSqI+eRn54PEHJ3HGQIF8DwIeRlgVAr7aSOuXEC4woN13FZfrlzrdcKbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754499461; c=relaxed/simple;
	bh=Uh4H7C+6gDDE2Dqo0tMFRjzxh2MC2kWTLOXYemuuCf4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=r36i1Y7cFWkoiiiR959QIcPHT/AMebQW4qe165/rcKnngRKdb1WYQ1uFV/caEJk5+k0EbjTITVb/uvsmKPIzP4FLFnThtZk83/PZS8ZgZFTptWh/8qiM5kRFVQGB2AYxN2BOhxU0+sn5Ne5VtoY/sZlXzLAUVOu8pRqLi7RHhng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W4VmPDro; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s0saRb2K; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W4VmPDro";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s0saRb2K"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRQ2G026062
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xH6qEsfLhUn8alc1Ok
	NQu6DZZr+GmmQVPs+KZHzk3Sw=; b=W4VmPDror/QqTdcZvD4nbHZPm+tHUpPX8U
	fWd2f7Tb/nBwvEKoVHt+lO/Lo0SONQIuTLXyKJVV+2HSV+9jO0fqh4w0KUWzlMQh
	fAUYzDjRRujZz8KEV4p7H4sGeLPEjvX6CRcZ5Q5IB9Blx8FGmgG02dLDL/GBkt+9
	oHWYm+Vx9rOXvZVETkeCw9kHo471Whf5bHsTZLzJnu3aE6kXa/IEnKaWJ1DZeflo
	ULFEfDp48fD8Ra6dnbkALuDpluNgf1FIm+nEuCzsdF5gf8YId4W4iJC77nXsCzIY
	m5e4b5+44aZyhSY9EMb/qbcZPFuhdAT7gCxmVQ6Z4HWE3qRokx1A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvg2626-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:57:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576G5SK1005756
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:57:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwx9uh5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:57:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/gVWCEOx1JHxcWMni4rcgkiUxXM4h+CvhO9t0zAm0SE3fjq/eSbMTuSo/3s9bpZ4ZXoJD/32pAAlSkb5IZOr9sDkeKMG0HjP0F+pmczXKlxA1WjqhefVryDwE7SL+GqloS05HCv+ap9yRBxYvNHxz+3smP+INhV7RP0PMozx3QLJsbytVyKwjHzqfVFehekMRte3ra8Zudpv3tbGV+R4FvtUn8Rc6AEAHUEj/vWxml1L39PR6iBakIlokOF7RwnBag5r60Jsjkeankz20YBmaLzLCMAAWN05AT4dkRlHelnm2YT2dLiekK1UGJ+p0IVMYlSbq+7xee4WLyusXYEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH6qEsfLhUn8alc1OkNQu6DZZr+GmmQVPs+KZHzk3Sw=;
 b=mL63WoCXeiYXoo1qCZWA1c/dWkE3c5IK2vtRpvNg5w+HyGpp7I+DzQuv0t2cdf8c3ad2CONNbFRypsQ+pYa4uwqIYCmfAiI1ffoFJDNziIMHL+6GwOBLJpVyuL5u0FHyOSfOQXLfoqmU6CXQuN4bhpithEAGIlsjUTryucI0fiJ6vyVYJHp0P1QRqa+DK1QFXlo6A8EMpppofJV+TrIeo1CAZcFXP+JB8lbDslmYURbMW7ICmhimqIhDizwHfwoUCRzL7LTQpBQLOhysUIAUuZe1OEJiPJZ6mkYhjSGpDH9wcu+JKDRKdwykig6Cr3P7iRchIko4+Tn3AYGRlcpNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH6qEsfLhUn8alc1OkNQu6DZZr+GmmQVPs+KZHzk3Sw=;
 b=s0saRb2Kyt0SsXWZapM9i95p/MrXQtAsuvLoggEPOFBf+W0kqi+20eFgpNDBEY42wTkGEZ8yGOkrDApxTOD72IFga9qaJX64ZRkHVULiK4nReLHyUuU82JxlzG6DxXuSDXlBEdt/8tYt6xlpcZEl/o5iPnuOBODXMpcZvugA/rU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH7PR10MB7010.namprd10.prod.outlook.com
 (2603:10b6:510:274::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 16:57:34 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 16:57:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] test: add -l and -lv tests for stapsdt
 probes
References: <SJ0PR10MB56723A5B7174C2DF77C01DC2C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: impress your (remaining) friends and neighbors.
Date: Wed, 06 Aug 2025 17:57:28 +0100
In-Reply-To: <SJ0PR10MB56723A5B7174C2DF77C01DC2C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Wed, 06 Aug 2025
	12:04:56 -0400")
Message-ID: <87jz3gl75z.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0247.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::19) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH7PR10MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: b168c91d-cb26-4d31-79ad-08ddd50a56b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?843WiAeFUIcxqsImp0khJihdPMJQ/RTzIkB9QjYVdOv7IB5DkQXRDwRdgBff?=
 =?us-ascii?Q?UcdpAHGyheKQhhU8d+/U9BF/XsXZs1G9o0OMsKas2TJd8sPs3Dul5qKpFL0F?=
 =?us-ascii?Q?gkzEHlyfsbU+vOuy5rr68bcELz8ailR/j8EiebjZIQPb5Df58yb/o1q6YgXC?=
 =?us-ascii?Q?Lcco2AMNu5vOjW8iuf0KaVqGTraUwrcijpUrTNyUBrrTef8EuQIsAd6Po8Vu?=
 =?us-ascii?Q?FHC23QCnkKNkktODuyDq3ZVAMns6qdzX2l6RYOxQR3idMKDHeMsfDJExKIsu?=
 =?us-ascii?Q?n7s8x79A5dPDtd2O3qyIutfE6BQlByiX7fckriH9FaFSs3RFJE2Q6pSOG8Z9?=
 =?us-ascii?Q?HF4xbwgGI8JZDThKrrGPe7t+7wxSgdpF7FL3XfjL3j5sOcro3lLV5Cr0bDIZ?=
 =?us-ascii?Q?zapPdqLbxQ0Y8VHWcxx8r82RtDRUqIUswYFWRKor8KGjHCBK7ddsV2U2a294?=
 =?us-ascii?Q?Gzj7iihrKgJVvnYLCagLo7xsmKDvhP5YI0DYrXLMe0O0tJl3E5aEjV/NsgdU?=
 =?us-ascii?Q?l9b8hEqDI6FbydWv7HQx9Wg+PnR5yJTfxL8Ma88u8zx5iB3l7AERxkjarsWe?=
 =?us-ascii?Q?WJdEtzKp62231qkPn0JwRvZ3+KgAGkpIiz3TgZAO4pYBmtnJvvrY6dIms5Vi?=
 =?us-ascii?Q?tLDENV8h3wVFiJBVuDdfDVJ3tAafTWJxcN1OE+rxdpgiCEq9kc5QdV3obNXD?=
 =?us-ascii?Q?eChiMyUQZZkFheoM5ZBAOkaIUjmtQz5tIhA0U8NzXyrTcItxMhUl6pT0B+9Y?=
 =?us-ascii?Q?AeJnwScXQg+XAfSmcvpQVUwOLld1mVOeu1/DJN41IhHhDHu2MYgRIDN6IG6r?=
 =?us-ascii?Q?HIaNKEguxVFgLvc8wzM8Finzkq9aT35bEoKBb++rJdeIJhtLKGt0guyHMOGp?=
 =?us-ascii?Q?O68zIWBgI4gogSRmBOTkCRSXY9RdzQK0W3tccQfxWK1bQ8Kte+ld4vOq2a0/?=
 =?us-ascii?Q?zrXkbj0SIBMXC8+PgrEuqIwHLYd9lUize0lwCGyqFYYjOZpSxWnSWoPwn/QM?=
 =?us-ascii?Q?yJyz6NvSj6eMlqjjZclocLPT32+aKDSIyRdH6P/X/cotFh/NAfArzvVJP3Fz?=
 =?us-ascii?Q?ykMmvHdhTGv+HLBReXFNMiL3NSSW9RugNdduA+IQcfudOqcWqgvER4P0TP3S?=
 =?us-ascii?Q?F9aJwZ9+H1H7Hp1V9ayBT0yUOj50LN4i4BGvDivrgnFhxp7Cc1NwH/sY3qLf?=
 =?us-ascii?Q?bgznUlyfou/fZ9bMa5qKcEuN/NRDkySUfER/EgDXglLLTo5cqJg7ZOZ12AhO?=
 =?us-ascii?Q?IyxBtteToCyBVujRPA9m7RXkecuG7lKJW1R/AyD+R4CVpZVppZqEzn8bMCvJ?=
 =?us-ascii?Q?9wf2F0F2CkijZXr9JKCPOpIQhHiHKbAaHQuq9Syim5sdQBmV/RGfyLRpFSDS?=
 =?us-ascii?Q?H8yWiAw1j6GN2reA79vwe3WP3o8+3l9p2kKTTSUnnxayIyPL4xdI6IvqPUiK?=
 =?us-ascii?Q?ew0baFjYLAk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fdFYh/UmOecFXgozgV5Ug91iTX4h5AQSJwVhiuSkDZZDoOw7p5K8R4blaCqf?=
 =?us-ascii?Q?8a8RKQtcaDBS0nUiduf4Nw82IAvPqLEjJ1zyz7mTeDB3BJ1ojCf4M85/xNl0?=
 =?us-ascii?Q?0q4phGjF1Z8njaoVEvA/MfLTofvaYkIw0/iC48Dy7uF3Hb0X534rdpgUazKx?=
 =?us-ascii?Q?6gkNP3GdZ8HXxF9gI14GpfMMbRy7qDfkRS14+6zha2WaFDd7hrK9ST/1P9EB?=
 =?us-ascii?Q?ZUq5+fX9FRKHDOJxDT5amDJaE1zjWSLhta5ISt9TMAy+g5AyWhVp1CiaBzWT?=
 =?us-ascii?Q?3AuAdBhXJki5nzHE45Lx9rC7dm3Jje7nHQmE5G0FGTX38NT4PCCI9jv9aufC?=
 =?us-ascii?Q?l+M0M/rK7eX1EItVQwKXSx9pT1f0KFIvGhHuuGMvivl9oFvMXBYOn//IBkvd?=
 =?us-ascii?Q?MKFNXTIawYRk2qMk3q4E36aVjCm8s9jgHMBhhNd/v96ZESCeNueV1o2zoG5A?=
 =?us-ascii?Q?F4l63WSc7QjbJotrkDlWsnXcX525rMF+AjlONiO/o7//IcVJE1pLOGevG0jz?=
 =?us-ascii?Q?B7KB9/1DFKldFzVIaidlDzT1BZ9DujXjJHcZl+Nb6tAQCybmbO/ly3ZfECSg?=
 =?us-ascii?Q?Omvp8DT3gJWBTuFHHz9lWlx8qfKABUCIh1sQRUXIBJ+Phq4AUwd5RDvhFrg3?=
 =?us-ascii?Q?wmAfM9N6EwNZxM72HwZTszaBg0HLD3iKRWRkeEO4F127VSLCZsYC9no7Q30G?=
 =?us-ascii?Q?u7H44cNAwhBdOKduOZlRb677FcPtRkDPElgr1lAm0yy1W39OoMoOvaeimjI1?=
 =?us-ascii?Q?wHqLvIEu3yJEzTtsFBnw1U5Ibjgkjdy4AawWYt8VJID0oREVzhlg8yokfTsc?=
 =?us-ascii?Q?zqu+3PC/RPSR6A7yUhLLJJOVBfhMczFQoeZ3XqhTNlYI9QlunwtAP3sjvyd4?=
 =?us-ascii?Q?ld94uEVCBSzKOoFfYyzEOQ/5IogYbgGSXGGAghutQojKVjYrwKmTBQRlktTp?=
 =?us-ascii?Q?J2k7UEDi7faD4tsRAxJhQoVaOvYGoGGGyavIrHnjz1wJZ3GmE5NeXlDk1Hii?=
 =?us-ascii?Q?n6jSSJcuZ34QR2LyF+iGk6IMh9ixw7UlAw6JwctM4nAYS4d+WMmJALQwWG8r?=
 =?us-ascii?Q?152sN312SYa9wXBazV9ZmOBEcRWYdKBj2aX9ixiHudApXwsLJ2M6Q7/kiHWP?=
 =?us-ascii?Q?GKkkGlYIGA6vpcmW7SeHZlfjCsEiQCZmrA1qSFmhtLfO32wec6FYHQXycU9H?=
 =?us-ascii?Q?cnu1jPhqkAkzYWUNqEbWJdFdpmQ935cxxNsObtcn1ApzXIv2cY+S8NunYF+g?=
 =?us-ascii?Q?dBvwfJ1Kre7CZVVeWrMkvnVsZFMUJnN0nxdKUv1Hzvi1L4lgXcxl1+wKhS7o?=
 =?us-ascii?Q?cwoD2GdmdQZyeFkLNCkPRdqaXNAG+3/jGPS6MKOCGU2RpwETX/CgwblRyMrn?=
 =?us-ascii?Q?IbejXe9lhM7Ex1Rf+FAmhRDEAHP3ZJZsrfsN4KJ+uJITjHzdd6X2j4KuPsv7?=
 =?us-ascii?Q?Jn+EFKiJKb0dR7W6joxvSNlKQvaI1BBLABGCKeLA2xnuvie9UkwO30EpK/Vw?=
 =?us-ascii?Q?0SCj+IedL5EKq3ShipsdIZUpHB04fcbOTQV+Lq4z6L1XDcnj1+0GgyKcKI2N?=
 =?us-ascii?Q?1PQu+uRTtjoXr5AUazXpcDu5FD6W7w27iaOk3n7KVmjNNLG8BUuDxmk1lBEs?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RZkAQE+xIcxdffrlaB/tuh//b/fV6FjddSN85LW8hXNAELWDxwR9kZsYxxkMselHoBroJCBiWFi4Y9jProODpBcp7Dr6qOyYB16BxXvJqfWDama3Y8Xh0E8p/jWKPpxs3grNDdi1kumCbG/HYXTFjGcfAkAmM491JGwJErdLey1b0KWOJym0RcPvmMmMrcfj7eajhrVxt702iWh3Psu6KU8KfLJdkUGAdxOVr0Qst4JqkOL1ou6gpTCEZ8F+8nRrh5I1E8zlJEHa4O3h0olGzt1/ioUIFMdgyNq5GmmYvzgpNYHMeURaNnyZNxCHPNdFOX2PFuVOJtbd7kCTfkYl97uVH5gOsv7RcQAvfBJ6niuC7uI4y89eY9HNNmhrOmeuZmiK/hW1KosPESM53Cvc3c6GuApVp/z9+0KDQvRiQlq05vK4wqE7ZWqIcNylclGQmadI3nBjR+SLNop5MbNAFoolwY3hzEPf3L8nHTDww6u56lJbnB3ldIHgxBSD3/pqFCf+/ffTfoBXeH9HgCnKlFQOdib0OKe1gNuJ5WCeQbWCCT0aZ69WKCtW0z7Hs3NUKv5U0RrQ5qbvEmo6myaGjO0Ps4yW5xzbDFLxdKP2pRU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b168c91d-cb26-4d31-79ad-08ddd50a56b4
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:57:33.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPvv1QKCOJkzoMvHgzP3d39S3MQGg2E6yD9QwmnTrsGLQYQw6A5wH3ukn6DxyHDfSMLa7y+tAdR8xNmmyaVjzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060108
X-Proofpoint-ORIG-GUID: MZkXiePGvgnj4wd_sC0r1mFhxv9NHG4N
X-Proofpoint-GUID: MZkXiePGvgnj4wd_sC0r1mFhxv9NHG4N
X-Authority-Analysis: v=2.4 cv=QORoRhLL c=1 sm=1 tr=0 ts=68938982 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3-PC9l1nQ5gY7vRoWOYA:9 cc=ntf
 awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwOSBTYWx0ZWRfX4XvHbbZwf0fx
 tAEz9P3u3Donwoe35GnjakiKtaqIe9NwsGfQOzKhUTpX64z2Y8+kTpRO7ndbdYJG1rz5HPSRKdG
 P77bMzLRZ8HXnIfGRba6FowF6Qce2aeSMdRta3ZNEfXIq61WxU0TkbYr6A102EDRE84LnOx8iri
 GvaNuHY5q9pGEDw07M/fXXu1/0TwoY4TmisCAg/a+GRHhFDnFBRVSa/DUafjeX9NzmdDlAwwwSA
 jb1vTKg5ZgfRvRvtPAuuTCH+sGmKpGujFMAYzLJoD8hHnGt4xddsu0Kri9eEbBFHVMKrBhqQmuJ
 mp84ctHD9NQtNKMhL3buCllEJskoagGKBggzJHpTzdElvm1HQknB3PZVsw5/aU8h7ZS1GHbtwD3
 5GtNwA1ke48fuh8GGSgqiMXDhnL5AZSw0RiAQYEYn7A0SNe3IhFWjWafNObLogK2YRyTq5i7

On 6 Aug 2025, Kris Van Hees via DTrace-devel stated:

> The stapsdt support in DTrace provides limited support for argument data
> for probes.  The number of arguments passed to a probe and their native
> type (signed or unsigned int of size 1, 2, 4, or 8 bytes) is discoverable.
>
> Signed-off-by: Kris Van Hees
> <kris.van.hees@oracle.com>

Bit of a linefeed there. ;)

Bit annoying there's so much repetition, but it's really not worth
optimizing that, and it's no worse than any of the others in this area.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
