Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006B2FE598
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470921; cv=fail; b=vCETZWRfuFWjwBuQqsBnlmcVudcm1eoKm9tHm8HbQvrD/9yNRWrRnsY+xnMjv52sDV4CczUgrp9rVylydpAZqJIZv6QIe3Yry1+fBQqL/X6q/a+zUTMcJLZCadumTL9NbYt7OlixrspzjB19pMbhcyLMWMfoQJ4tbMlDtSqumSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470921; c=relaxed/simple;
	bh=FHENdPOEPJ+k4DR9IaVyVpgw0kBIz3l3aXRvXG4/QPg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=b5AyEYUidLQEqg4JBcmvI5BxR/wj94wNG8nIuBYETq9J7ajtjx+Q+WtGhRwgp06m8pllFp0F1kciIEDi4VbdSwKDDSRv8CzvtDY2EQfYnb4cBgXl5aeRwzXyzXgxD90u8WfEEwnpv5kE3nfSuFzhmRZ8PfekmbLqeFXYD8f64dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jV1w/LM6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Yr+5+qLN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jV1w/LM6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Yr+5+qLN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QHPH9N238781
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Lebes4okEQ2poQP92tXLirc5yJfTvhKuWRHdmVfusB4=; b=
	jV1w/LM6KSTWVp6WvCmSSfZigD66ssqGjU24yyvWUnT9RXcWFgcOWyFObALARG7W
	Ug0L71nADtmB5XDEdb6sjthZsNuhG7TjUWAgwbSZzP+YUzdkKbAxxdovwuaF22n3
	h25f2KJo7gcsOpKNWL4Q2FAIBI/K7zbhSUOKhmge0otWqKndXL5ewlJ5Zj2YCrzC
	D8+6kdGlGc3WZ/XDw/mxGpCrQQGmqIQeJRB2x75CACvRxNv8xP/6rLpWzpib3rL/
	HlA5kedmRcvDZiMxX3eR/iidwxbdvY7Jm0lrJuuh8+L89KBgkqfLWdTBzvgumVh3
	1MLB4KlWr83NpOnkvCpVmA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvpmrb3c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:41:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QNeZSr019835
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:41:57 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhdwwwb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vj5O7zLA4vBtcJ075cNqq4VUX5fbs1Gxtsv/U3OWJcAwD9elSLO/mVXwH42HYCdjx1ZTQW/xUFAKgrX0HxLXi0FR4Q/B+asI7O7zsGSBHjM5lo8iZQ7TY+7XjeRVA5wnaEjLkaJAQ+t4WQenTiUcFQIXRKP9/kOHb/Ru3Na2pN/w+UomrNN3nw/hjFgOHSJfTV+328+pVfroeHIvxu3DSiFaIoQbzaW1ksjkjc2gJC0nW9CpRlAjf8eGShx8UEAPwJrxJ3RS3ROvDI+BwyAu/ucWfBPtgOH38yfrwvLLoBNRqyldoAvQ62VAc65gfGnmdRGLKGvfX92d+I2w2cHeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lebes4okEQ2poQP92tXLirc5yJfTvhKuWRHdmVfusB4=;
 b=qZpMSjxHrW+rx1/LTDfPMXky9qvMG7JSatS1Y/mEtgpK5ivkLgrv6sUEK9S7OqhftjHjkNZUyUTPiCFickfIUpR2jgakCepq4eB/iw9j+pKMK3/w4CGGdrHGZgbFMusEwPYifD13UTxXEWdJR8ZOJrvu4yiZYV1SaP2WzmXoo8GzkL99Ycw0hl/pS/sa9QcjWcKf9fYs+pNZdK9ebYWMxTZcfGZY8K1pVLSvUz90BjrQc1bEmNTjWubO9OO5XbeyD0u5aEvUv91vaHcro8i4cwcTehiKREmG+Ac+nrpFUPoZtpq11mB7MCBFltPqVwUq+tDk+WDWa+3XP4RvTM73LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lebes4okEQ2poQP92tXLirc5yJfTvhKuWRHdmVfusB4=;
 b=Yr+5+qLNf6YoIj61++Jkm+y7257h5Hr4wPtqh82feEEAqI2DZUuDKWj/EVDyM0iyr6K/KgJGhCnnYbBZJZaOBs07fFKh2n1s1IMwo6nI2U3SXKnfWvpLYKE+vj7dVhVekTQ9UEj5LnJVQPPnBMGEjjjGkwvfd+hMEo71jFfcXe4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 23:41:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 23:41:54 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Support deeper version numbers (e.g. 2.0.4.x)
Date: Mon, 26 Jan 2026 18:41:49 -0500
Message-Id: <20260126234150.20939-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:208:32a::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d2e201-9ae9-4dc3-0e90-08de5d347c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e6SY8mfISKwMaHPuJAwRDZxDjmPgsiUE7g6KAFL4gAlqPlGltCv7V5geNVsR?=
 =?us-ascii?Q?N5W40o4mZVdeDpmS8gPPso3XJnyNmUhJIbfbyPl1BqUqUQcDZ50vIOE7TgzF?=
 =?us-ascii?Q?kEN21aUDRssrsfyPpk9xVLSR4147PtN6/qTTin3zbIfW9hLDymD4E3tKak61?=
 =?us-ascii?Q?KC55J59gQzcBPGPyOJZJWxVolu9q1ezP8r9GwR6LDW67ryBODo68/BaBFVKo?=
 =?us-ascii?Q?0fAsCXrTOkKZuruODaQNqUxRpIXA/pc596bekCpWqPUqNcoAZThgEGvJCNgK?=
 =?us-ascii?Q?XSOFbyKAII5GXOFScebLI4ysCJ6H8GwqPGUXMHyCdwNJXuYq4hIMZQgD95QX?=
 =?us-ascii?Q?571oMJVuXviK7aAIsAOc/lKJzpffSvAcSUs5skG6o5BtDi4QrZWPCeAvQ0iA?=
 =?us-ascii?Q?Wqf6dYMJQXVgT2aF7AGIUx/Lm+2rH5WkfBsee97eGpmnmUec4FiHaH8m6mE8?=
 =?us-ascii?Q?Y7FDXFelSgW1dIXFFmZIG8LkKkapfPwp7DmtI2aRA5jnYCI9sEp36H6XgJKt?=
 =?us-ascii?Q?Abe9h4OQb5aq8Cs6d2o3AHrkpms9x/7TDvjaeMzKt8YusVrMOR+4zbvGgmsS?=
 =?us-ascii?Q?8STrCbfNrawKFQVEN0d/xTXD9+sXwB0u1gKrtF7q3jQiGez124iKzc+RdZbQ?=
 =?us-ascii?Q?Wv0SJJUlwdGUuxkncfGAoCQRpLd+9pcNJe9DQUi/7c+k+wajHgfUI/hL5tk9?=
 =?us-ascii?Q?LWDQRyv5t9TZIccrv+1bnN2WU0SrgoJ16QXNi2bZ8cxmYVHst91zuPZQXh2k?=
 =?us-ascii?Q?Cey8dVHm985rrL+0W0BdfmA8KBPeJGhEZ3EMT7bGdRVt2xmt0iFh5xHwj8xK?=
 =?us-ascii?Q?yS/Oq2EkGCxpfqZAexM789Pu5dZ/Ary57IM2FOt3gNoMdKOQSIy3cAmHUFiA?=
 =?us-ascii?Q?GBDuXG12ZskPo8UrfgEuOrgqXIa+y/eFyuKObuK9TF7O2Z5Y9beLZrSK8Kho?=
 =?us-ascii?Q?JugdYcjD1rkBDrnPQC5sfMOmKS+E1pylUpYe4BBkWPtgszhKF9Z6ryo/4XQV?=
 =?us-ascii?Q?8YwoAkFG86HurDs728C4HjzLB7Rq96srtV9y5gzMh4buSF5zjQzim/OAOb8Z?=
 =?us-ascii?Q?g88f94ojWA7j7JVl1Q2Lo8/18A6JUEwyhkh9mw3pFEEtPsN5KOZEExup4QoQ?=
 =?us-ascii?Q?4KGxQYZidvFTfGyTld6avfCae3jdl90Q4W/0XsGeCMlmcL/XCGZnxev4slxR?=
 =?us-ascii?Q?LZo8+u1aYsOeJ80n+9de0A6vBNA7/2QvNwK4+NcBwF4rckGfwFDIji8s7rrY?=
 =?us-ascii?Q?drOhaVRJKP2Yx6+dLgQvDUlQIx0Ed8sQGu2rI0hKKeAV43BvVeSxABUTyERQ?=
 =?us-ascii?Q?Abfr1f3lgmDKtECN2H5v7BeJu5mGyDeinplMmPpXc6qw0tqGcALDgZa5nKqX?=
 =?us-ascii?Q?F0eGc/YX1ggR8nzhMKGadg+GFUJ9YJq0r6jbSoeNC7AY/LSXr3WYNJk2/wux?=
 =?us-ascii?Q?epag+Da6c5EiZAZLl63d4GYn3DW5NfUwL7lb7FDoyCzoOdU2chAosnRC/c92?=
 =?us-ascii?Q?J8hFKgF21aG3kynne/pOgvKZutLiWTqM0iHjZBu1HdKRwdKTk/631XYrReLs?=
 =?us-ascii?Q?Tj5uRpBeLrLJP2XRIIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nEMQ9vHlKU6TLXhZ0hoOzQA3PihTA7Q8/rx65MfoqF4kGl4Tdv+BEkHNwHzA?=
 =?us-ascii?Q?cdUvMPD35+jrRKjePXpvL872KOWWC4sIrQ9GNuMXuz5Y9S5/Vz/JwUpZzdUm?=
 =?us-ascii?Q?os0nY9jZ2UZNTjGXFWxINSnkSpdZiJWEF8vRcPxvRWnm5OLORnbHCliMQLWw?=
 =?us-ascii?Q?MLORmfKz76p9BPvYbYqqr+Hf2s9N/Nb39nKMX0Oq9b2u9obLsswhgPfZRNXH?=
 =?us-ascii?Q?cfrdItLqDCTv2Bx9RxsM3+dOggvW+g9glTyTjo0WZe94yTZyN/t1H23W9QJr?=
 =?us-ascii?Q?qLjJ4Jkkz+g1aKhYOeQ1t3WDch/SAh39/7fT7Y+0Abs3xc/myCYjp8wn1XuJ?=
 =?us-ascii?Q?TB5SL4yUVepQu1SP8gg1DFeAJbTyIst3pznOjdoyYdbiBludFr/hXIaXAhic?=
 =?us-ascii?Q?p5C/YXEK9eqrbwok1L/A+EImkqAfapjCvUqrqOvsLLtHwZW2l3PxQxTtMCQe?=
 =?us-ascii?Q?iNJmI2nd4MBdL/jxrO1Jg97pDcMPazyixFtLPffYxIP5R9NZJBM8wFb8HNH0?=
 =?us-ascii?Q?2vhl8FrbX9B4NZRgxTXkyKfzl8xWi+W7PaWz8jD9jXhQ9kP/Kq3lJOeYukBz?=
 =?us-ascii?Q?u0AIguC7vl9kcboZIRg8qkA88POGvxh9B+kEWR8WaVpJQUVIWoPt14gPVrnw?=
 =?us-ascii?Q?i8O/5wRIq7J9oyIrg050lXXo+zOZowkhpx5mRvxd67eoccrcDWj0Gstlr1HY?=
 =?us-ascii?Q?8IJeUGOlkD/EmjxNum0U7cWvrOLWJ00PaoPiajrjrVCQ8ggA0oNaQSaZWbDj?=
 =?us-ascii?Q?Gw8SY7eaibl80NbdJnacl1jjD+yUw0MPBKLhICvrgM/eMFbdEobfVtnHDsJU?=
 =?us-ascii?Q?WaF141p/I7PkomjTXBwS3AcfeRrxKGSE4vrfnLe/0CdUt/WtwdHPu3gzKsQc?=
 =?us-ascii?Q?+Dfp52u6N+XISW6x1VDRVZEFCUbE6icDftfCy9cll1wx1BV6xk31ebd9ObnB?=
 =?us-ascii?Q?DwAB+KXeeM2JEIVdjvoucs9DwinRiW9BUHbEbKEL9hbSO0Qy6e9feFmllfWj?=
 =?us-ascii?Q?FrfS0ZLsXaWj0O49tMDboFshwTz6Vl6uekeCntxOAGkYXAKXvGPfBXQ2QjOA?=
 =?us-ascii?Q?+n9d9NbV1QdXmhf7CaTshmDXSnzGfWe/wZcnpbBLFhvtet37RcpVwU1RElpw?=
 =?us-ascii?Q?kZIiji4a/kptmAJy6SYvd3c0OMimR2WlnB5bpum9dJVcMbGDpyFPzjn+1nNv?=
 =?us-ascii?Q?+O5Cx6+3CPHdZiXybSM/xbDTK832vc3rGxnsWUMYsgyUd9RmtH6eq3uVEINt?=
 =?us-ascii?Q?4aELzvsy/T75uLvYRTv6dPwT/QRCJ9UeL/QSGYUODw5saae9iRvxhkjjFUbJ?=
 =?us-ascii?Q?lmube7EJtVlG+4EitLLMnY+xDlbjNeVI53qsfUIbXs9B3Ndlngc3FW358oYU?=
 =?us-ascii?Q?YfU34pHySC5iz66iHslKLaK9HeafpwVQcHnBN1nLzo2crAcJiYdP4fE1qKAP?=
 =?us-ascii?Q?Bqc2IEC5heG7syUC2RoP5PwTTMqrcdZIEwTabDe9xB6izyKDpiTWZkA2Xk2e?=
 =?us-ascii?Q?v5a54ZxBZMnCh3f2YWXBRfZoXPAehGvWMrwG68ApLOfGcRoMdRKG9SNq1tIY?=
 =?us-ascii?Q?kmscud5rg/aWWgYHjgM+wFK/5Hd64vxCJyBrx6cBMPIXtiq5FMgxnBdy6aOK?=
 =?us-ascii?Q?1TUINONjNj0MKclksyL5ZMxq5HC2nBkLV2eg4yDYafcYOcZOjufEvNqDkF+K?=
 =?us-ascii?Q?YZknyAqmulx6vXQLsbfdM1ij41bDMabVQWzIqs8OzgIBHmFPcSff5ByvJpPI?=
 =?us-ascii?Q?k1NH8EkqpQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u4qrlqpasjcjpL32/TS62DLUakSbDFPIPPtNkcjhnnaBA7rpFGCYEESup+3GZs4yvVAhEo8iNBZ0h8DG2qAvdQAFAGh0uf3/0DBoPhw/FzX+GFQMCEHDRFLmkZIK7Jx5e5YJzUkgwVhkWKTEJQzhmZetAQnfWLDaVCPOC0b47jz2I70PP6JqijQwmw1Df9yxty779eOCVCz/ivPKYZgUrMhDYOs5LsNvwicu4bBh/kIRw6uo06xU/fR2D5oiR5GzCxcDbFfJS4WjM3j92XnBRkv46kKXa9OjubHXCv7JuMHCEkxRLH/056QsDHhsnFJkhdegkXa68PCZWR7G+gLi2tMG51CwoojKxwkgaWqf5M9PHFJVv1jM16Gb2ik0b1E6sCdF+BW8Frud4/6aGpyy4UzvORJY2j0QN67Z1Dyv8Vo9jrrZetIBWd4EjeokGWyxl9xr9WfopcfsKzRGQGGdyNTR4T/GSk3PS7NcZgocleyQT03oDUcPO/pIZ8rDfFPKHxINs6mOZJ1YRsnS3lnxrZZuDGLEcp9zrvNIM8imUnYho8vOoptkwXVUatIjYc24GEdvb2neSd2i/dXHAQijbGeuGPPChQaN6k7pSg04x9A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2e201-9ae9-4dc3-0e90-08de5d347c90
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:41:54.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajXCH4s6gjLxviyvqTrEzuOb2eWo6pU6+JEtOZDYX5ZpnazvCL6G6ZMvKR4rwyAKO/gbWzn94cSXqvXsJqcZig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601260202
X-Authority-Analysis: v=2.4 cv=Q//fIo2a c=1 sm=1 tr=0 ts=6977fbc6 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=26Sn6DwbkJ2VNwVrCaUA:9 cc=ntf awl=host:12103
X-Proofpoint-ORIG-GUID: SE0-YAMkCF_0BqrPmKewPgizBVBQj5bN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMyBTYWx0ZWRfX2r81uUaTjQjv
 ZIO8GBGd5W4SSIKCUoaqVAmYdWZePLc3uKvYmXIQ2npbX318OCvKBMgWMquTsyyXiJTKa+o8A2/
 itBstk+GeOUo9/EUhPiGfmEjIXmd769BQqZUP4Iy4IXx1kA3hHyzhcPizFrbZOYSHsNp3Ur2+Cr
 IUgR0vZ4sCeV2PRtFuTHC1TLq1s/igg6+wQmC0+H6sRGzuRoDO1BYKsloNexiHeOIuXtp1VCLAW
 ZCGfsEhEWGHSdziyBsWxDSMqX5zsKYF38WbMWtRkTuftJjfKjzU4rGM+yJjZoDiWj37YHJWMHi5
 kgLKT8qJVZrfUs2G934vYdKfsHmcyMsLPQ0aZjNEFeUxMJH/POm2/bxlAGBrLIz7JU8dCbylhi+
 kXuz4Zrj5fXNIoREM5ouc+hSqW9TNqP7WZCNgMx5MeWn9MatAu+0DC+rXHaFlEU6BQSiSConAHN
 Ow7uSKV5UbAe3vuGLDgF73mPOISGYcTl1v/PRnpo=
X-Proofpoint-GUID: SE0-YAMkCF_0BqrPmKewPgizBVBQj5bN

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/mkvers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/mkvers b/libdtrace/mkvers
index 6f9240320..087c09169 100755
--- a/libdtrace/mkvers
+++ b/libdtrace/mkvers
@@ -10,7 +10,7 @@
 NF == 0 { next; }
 
 {
-	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
+	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,3}$/) == 0) {
 		print "E: Invalid version string: " $1 >"/dev/stderr";
 		exit 1
 	}
-- 
2.47.3

