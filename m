Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE52522FF22
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090201; cv=fail; b=WcOLU5qzXlpuhmhZ/TqcoiMk+1mqGOrV3MK3slsKTprpEGK5IQN6R/WaVszJpJxBURI1cihq/FF/2vO2V9cJNR56l6QUMJhDkgcGZN7x9BpS6n0GNO8AqFTBRBVX5UQdbb1yeY2gXVO9cMY3RRFXpfV4xCcAnSpgTWazfJhdF+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090201; c=relaxed/simple;
	bh=7szzzXCkFihAD9y+gxJOpcHVFz74xmBZL4cpip64n5w=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Z2R9SQ/jGedUB3fRo8tyyNVdivmS2L6iRhLMKI6l7N4g7Ghui4QoG2FIDoebdyVncrYSoYtnEgwUCzrJCbYj6XVLGeCo5FXuQHLwQDUM7h+g9rCYygLAM4duicEpJbVn70a5sxxuKaBvyM7GjCx3st/79FzgXCU4o/pZMc8nKEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZALIPbP1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iyYfickr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZALIPbP1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iyYfickr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkMij2012472
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sKdzqmwBZgMCQ48xlMRXAe82NjI+QNggkuoUpYC+LTQ=; b=
	ZALIPbP1l6H+ZHBAFvthilf2mVRJlaR/o19QDyayXw19s74O0FdOx8NmhtBo68KP
	AAB9V8pCeJDcM6bGEfaGemBi6gz26mdaSClexvA9Tw0kvOdvMDmAAB5RtSDPxiKV
	ACMUAfCe+8zgvSqQYJKw+IJP+bVc6KQELse5cvoApLtZ/cvU2SE5ijwR+QLmfY0v
	6PAtFt/OhpFxrRw62ObLxnCuevXmGg84fdMjhNP3dxTCKVhsUYMR5Ocu4/o7zz2n
	zVY9dTHkxAu+eGiWRqBcJfVeReoBdaUR6VzRYoK33yPGDWalfgwOvPZTJaAYY270
	z0GwPYSDkcvwAGmQarbBhg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2bg2em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:36:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJT7Uu024101
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:36:37 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtdaed5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:36:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On02QH78K8pPBoozUwsPN2StR7O/t0ShyMAhLUwfsV3HgHUXpQnzYwEbvh1ZiVFj7JGPkoGBq0+KDNMdYvmcMynlMmMfovG4axXqrdtbReQ3DMJVzQrhuEe+uX7VT+W99c5UkRjnQAaan6KWUCK201vElgKXIx9CbmDODLxt0T2tuDYwf9dokeciL+yAhN0QyQ/DaZC1bD9n1rOnjQwLh/JqPqy4xK5qd1yWy0Ndm0Pi6uIzmVjXPE1zWVFHD5GZdxLKCVC9iTIq5w/wMo//MCS7SRLG5ftHXahNKjtdCxZkaWjgF1ezYAyZ0gqK2lVQS9NMvBnNah1kBpEKrZUpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKdzqmwBZgMCQ48xlMRXAe82NjI+QNggkuoUpYC+LTQ=;
 b=HmGV/ABJO8rG72wUZJ296rX3rPEL6o36YAI6rHV2Jc8uCJFVE3B9LaXyBq/Lw8S4/enNwvMGSMwRoNkBpYN99VsJKRza1P5LmDhL4xJSSCFFKfL6Gi5Xhidqw/LiktmNUG5GwLSvYGtlxiWoqlllyIExAQg3VkCO5B69SwJUu+5CVUoSypnxQyIOPphYjo+iqt6LulMNkp8n40H4qb8WynpfJ+NEkf8PQCvE5eoDGoaRjw7pnA5RnkJ8iYr5d4KxJHoDSM73EUL7ndr9eOZqfdcq/pbCodWWW/k4B9bpgO3VeaFArLTKBQAYHwaJLzSfpMTK0R5L7DDrdkqRDCz7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKdzqmwBZgMCQ48xlMRXAe82NjI+QNggkuoUpYC+LTQ=;
 b=iyYfickrj89JFdsdAVg5Dyy+4vGKU5J5uJ+S7EeaM8HVKyVlU53wKfOB3aA412HDYgK5XKrI+2bHnA5fqQc4HCrjTlnFbz8j6XisCg429B294cJbcHMTHiUcSpoCxEWrKZwDE+7Y8q1/mDrmUtEciwOAs8wnsVksPok5NklZ1pY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH0PR10MB5114.namprd10.prod.outlook.com (2603:10b6:610:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 20:36:34 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:36:33 +0000
Date: Thu, 18 Dec 2025 15:36:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/4] options: discontinue -xversion=V as a valid option
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75225B4E633FF1F79FABFFFEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH0PR10MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 722e345c-0f4e-4d0c-e953-08de3e752212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hUkpVVSBItL8OI1GSzXvIDBd+CssPNfmeIigW9+kyM+QRKU7s/xWIZqCsbPt?=
 =?us-ascii?Q?yA7qONqyTMNYi1BgjGC3xBdNkzSYwh3RX5jUuWowxutxIk6Ik17IJ3HWuJBW?=
 =?us-ascii?Q?y8wk8RN+StM8zRRGQF/PSOjY2epQ09B8NXtVIkp2Jq3LrayFzWHsmsPfK79I?=
 =?us-ascii?Q?/q0cAjPFbptdo+ISo5Di8bPaqkzw+CMO4z+rwm9+Q0uREEMvQqH6fI9SlKxu?=
 =?us-ascii?Q?aW3Aiu9ngz8nLjO2TTFQwBhW9tx2teXNxk1EHIMWhAfMDSElIP6XGbkfJ0Pa?=
 =?us-ascii?Q?jgqyHotX4UtHEOBQr3hWOFkuOgh2chwaPm7PJVbZb1hXW0QSH7LCd7T7SMc8?=
 =?us-ascii?Q?9mc5KN9dK7QT4dX2Hchk+5NSFJF43sn5aBndI4qEdA9x4mnLG+kXVRVOGONh?=
 =?us-ascii?Q?ZG0EA57ftHsjXIqzjepbqbGrXYEy8XIrtuL/oRtuMkhKhTFvbAuyeyma1Lrb?=
 =?us-ascii?Q?jdw7G47fGD+vLyNVESg3FnRLbxZ+cxLdtACVuUA010otDSTbztsIyO+NWgTO?=
 =?us-ascii?Q?V+QX44FZvlovMDo6rCdCxtHYa7KpY5smJ9pNuPg4cb5AxZkOeP+L4JAzc5tG?=
 =?us-ascii?Q?fTcMqqJFwRgDpKPyHumywWweeKK901Tauoap8LzKncaPoVSUpk8GUtJMbQHQ?=
 =?us-ascii?Q?KdoaVfoXfbN31BxgB9JRVUhN60C0pFQhSyjEVQ78oiNOuds8m+a1Spo9Ncx7?=
 =?us-ascii?Q?VJqeIkCxftC5in24p0VtpKbDxgkR2RjMxspglhtSuGkRSAl4FGgyrI8zO/uF?=
 =?us-ascii?Q?ALV6RVxrWcGkamo/uClX1H1yRatFsyl0Pz47KM6e/NynUPNyq+4+h6yihxbE?=
 =?us-ascii?Q?WRJ0DEpxK7OWLvFjlsNJ36xYhJvC4LZO0T5JlqK/Et+U6Urh+iH2rAUxTZFV?=
 =?us-ascii?Q?3f3iB6otlGFgJPPnsXrNcYTxf3GMAu/ikrS2QXCYBTlPvude9dQzmnPM5GKK?=
 =?us-ascii?Q?2WOLnrZT36u7iScylDZGlr7f+8Wj7hC+DB9sEy8uSB+twRLGUapr+qrOZmlH?=
 =?us-ascii?Q?NDAokOEXVBe4kk5RxcxQrgYAyQebp5lNW+mEQgeRiU03/fzh6CkY9q2qDwCh?=
 =?us-ascii?Q?OONi3AzFItn4BJFPxG4gv+cztLJ/qVZ7pO5s/Fj/DOxPZySQgdvjI4/msQyC?=
 =?us-ascii?Q?31PHwAcvo2DUcOTaJIcIj6bClIWKAKh86b67ltyDUwtNxC9E4kiG38AAXFg/?=
 =?us-ascii?Q?fDfk1lFql6k+T7y43iNyQ4DSOpDcMoWILrubepAMkkgfMbNIYNbWlbo397VL?=
 =?us-ascii?Q?pmFk/TVj+/EU8mgICn68R2hB52L5Oszj/VM1vrRRImbByggePAGb5KmPdOy1?=
 =?us-ascii?Q?KYMBoCgXODI+xNAQ2g5zhNlAOqX5QEKfk1rSa8MfihZOzlH5365t8HpJW4qZ?=
 =?us-ascii?Q?tm4P5ANPwPPkVDSpkuZnqYa72aplgu4bEomuRD90dY7nuyx1us1TFYSoTiSa?=
 =?us-ascii?Q?AvgeiUP2cPY+OBiTayrlFtgio6rG12Kdntuu1TdiEUCXpdD7KRfxVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xA7OnWUfoRU/a4pl0nPsOOY74zxYs8To2Ttq6bKy/jWAZ46uLvWdJkUbD1pV?=
 =?us-ascii?Q?88/Njfqjdt5/MM1tw6ay/Z7VyvnIZVtuwhYpmNvhMvPbImCE8KbNn8AHzq2J?=
 =?us-ascii?Q?sKeIfkSFxpFCQNGkvLNuTtDb4dsZaiNM2y2WMzBnFyAYc9rRyGRJTHAzMFOJ?=
 =?us-ascii?Q?fCxJTMTCURC4zJBswW3Tm27xv9TOAHE/paEUsm8nZIqT3swS00cnmnI0kO9n?=
 =?us-ascii?Q?GovRXqcj5m/RvQVBZf+nTJuHbs6tACqGOEzUAW6NTMpWCuHH3iWxWswYVe7z?=
 =?us-ascii?Q?JUP8K73kjsaJ72A/DI6hYp0tV1CMM6M5OfP/L4hNe2DP6b3ZIZmz00BPRdru?=
 =?us-ascii?Q?yk242vglGqaPguGPRnAIwvCjGlDdGFPh+xqJNcLgfc35llY53Wg43FQ9pbIB?=
 =?us-ascii?Q?tNpfLcNMpnuNuWyJ7zSv+g4R5CTHNpL2/sXR3A7YvqWodE3ZIt6GTPoDUtRi?=
 =?us-ascii?Q?kRDWW5HH7xLKegDH/Bvs+ttZPhF0qvulNVUg8mv1tjH+eSqcxF2jr+d5QbeM?=
 =?us-ascii?Q?Wi+f+M+bwb2SYQ1G8DrBhgR4hphle6qLO8Z1qw5WN7CXJ3uyqIAlvk/eFJLk?=
 =?us-ascii?Q?pr9Ho3C7bMeJ7krj7KQfNVV414ajJXi2voQabQaF+OiXU6aZHLM1SUuvuHuz?=
 =?us-ascii?Q?SkeOfQkhF8+xxn5JnVEq38achht9YTe0iWzQzPFHcVfFYXEy3XSM8XZ7a9Qu?=
 =?us-ascii?Q?LNsAn3CT04CJ5Mp4wn2uvxFHj7t8YIPF5uosqDwsvokvJUZO3F/RF6f1bQsi?=
 =?us-ascii?Q?mnE+3sMtgIF1qhUaRlvx10Q78wokEMKMZxd9RBwjktCDts5D/R1YCPfaLREq?=
 =?us-ascii?Q?elnVn4UD3Cy9/LfE0UZ7LdVPWxiTUoyw3M5yPJw5RJxUQ1aoXVnjlXzKw0dn?=
 =?us-ascii?Q?BgMg6aQ2ILBbe8Lz1Y+rz6KhblrynHee0QFRZ6d8GZvRGQiTFUFPdEZNQF6y?=
 =?us-ascii?Q?8pAnAfIc2bRVoz16RKO6TJS2pOA2yf76p+BT79Sai/A4/ObzGyI8pEeSgeY9?=
 =?us-ascii?Q?t7LCdINycOUjUcnl17tSQ11/2olMykFFYw1C8BNeteEPDGcpksjRTZuoAJIv?=
 =?us-ascii?Q?RGbksYmdLUWF9umX1+qpWlus9jBthtWOasrM+uSu2MHLqIOzWbb4nlx9SSxS?=
 =?us-ascii?Q?l+BFfOH+jU82B7YD4Qlz0pnr+AmEAJwUK2PZXYSH28RPsAyF9ssjDpfJtxz6?=
 =?us-ascii?Q?drOBJqnc7ZS5SgrwZTpr+mPkBKx82PaSdPlfjwK7iDcxbg9fW2GWwi+5pgKk?=
 =?us-ascii?Q?Q//dyySwd5nGQGpoc9uNbSMRlr0WLBT1/icld/4ouf2uoQSo7rdPzW/iQAmY?=
 =?us-ascii?Q?/F4TsbMAAHxh1tKbfPYVO+tixwzELwflxHdICw74yt7Z5BDyc0Bx0PZgUGT/?=
 =?us-ascii?Q?qLNcF3vumibzLylc7pTem1sN3o4pMbSUqf92Sh5yN9uccfoYw+RIxZUnyr7/?=
 =?us-ascii?Q?Lrg0GC72Oncu+gTq+qiEL0mPgSEYKd68Iet0Xt5vMjLCddL9RZvDfCY+uNQ6?=
 =?us-ascii?Q?7iOjEQLA59/dSn7ety7olwKnoRzM/+HFqDN812lcd5EaDiF3xxQ8IjImIyYN?=
 =?us-ascii?Q?/+Cv2tnSyHSvxXqw0VRhvdmaTmFcbnR6tHkv8PW3paYUu5LMbJ913Zm3COql?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mqPqiTzipXsMn1myX2BlR6IRQkUANKmTBOjKsm/mQq3rBvGEpwnTREJkbGHolR0DHjIExJwbyHgQwz8VvfKVvhijsVc7g5FDewFPqmKNIulLGUqLfDEiz1F09tzPb7Z+nkoYRvWD0XEPMm2jE695F5nqSp71GoAMpgMtMDzFLxKO3CgVjaCoDzWWShSu7G7j2oE9w5kndL9ijhCazqFJhmPhNsfaRElzWyW918GJJodE7vgWUh3ZdYFtldciatRAExlkpOUFhuGUt+DpVCsm8G7emkXDvvFw9kHs9WYnuboLndJokbLLsoxrq5yj+B2gUf2rPh9z3X9kBpiFJekuKpWxhvd2NdrBK9HrKIVD+XMpa9rRbjjJQu8EDhy+t/rWO1EWikPQfXkXC3WCVgh1EufyVdbyqLGy5W85WFW4RX9scDybEL+KxgQWxQ4OYSW7hUprZfk2TNg0yPvfBtBSEynGWsavXr0rmfDSuFlcRSonvaxC2Ts4fh/rMevXFdv11tIRE2b6KxPi8qVYQGtiRG4AMuFBR963B1EcSM3mxS+QanEuxHxGPhajRZjSytKCxjvIJonD2V+e0yV2wRU1AvB+yVp7j7bSmF9t5rN0Vb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722e345c-0f4e-4d0c-e953-08de3e752212
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:36:33.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZIo0HRKFmjFWnutXKpsNj7scRsvvaigfCZks+tHzDJ28sEV5H5RrTn+bBzh3S5VnyurceHa0nn13nrRzSVACPufCNfw1rMH39qzA/erq4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5114
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE3MSBTYWx0ZWRfX05oq45l4Dr8B
 0M++TuqPRLDSbo00AZW/Iapp9NWJ8CftahEIxuXBs32XAaN9cnvhrQohe24QkLTQAKle9kGJmcf
 ylKvINGAuEh/ziujJIrkeHFatiWb8O+wozCGf1Q2G6UFdp4VtGtdbj+I6ZooNJKkgharDxlUwu+
 xllCB6bpRWsX3vJS23R4qmr2EPYIFvqiAR1Z800Z6WlowAGFgqF9tDeJC7RQ0RGdW1sDpwXdvnz
 iTsE9q7NYEdVdHi6dMVlKzO3PL1LbpYk+oUywgA/K43+mWmeXIVAGlLXgotxs42jIwxaenfxBaC
 kzXvU9SJlAYk0+IRJLCpD9A/TSNDbDqItkdvWSKkBS4aeID6lzHYAuwq+WJ5puAzxW0C8tfwP/x
 vuZyEO9qTApGzfaeenRKx0MzhqEtqH3NuXIDvnk4Hy2Ed0ONWS/TgMatKmKJvFgf0gwy7PX0qKT
 GVIIExn37PuDt0DYgzA==
X-Proofpoint-ORIG-GUID: Mkq8rdbfnaBYbBcLDqv8spDum1I2qCaU
X-Proofpoint-GUID: Mkq8rdbfnaBYbBcLDqv8spDum1I2qCaU
X-Authority-Analysis: v=2.4 cv=ObyVzxTY c=1 sm=1 tr=0 ts=694465d5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=_kUXBw3cv70qbZ-X1GQA:9

DTrace allowed setting a previous version to operate in compatibility
mode.  Unfortunately, it was not fully implemented.  Translators are
not really versioned, and if a translator uses an identifier that does
not exist in the version specified in -xversion=V, data structures end
up corrupted.

Since the usefulness of -xversion=V seems to be less than the effort
needed to rectify the implementation, we are no longer supporting this
option.

Tests added to ensure that the error is reported for -xversion=V and
when set using a pragma.  The former version tests have been removed
as they have become obsolete.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_options.c                     | 14 ++---------
 test/unittest/options/err.version-pragma.d | 18 ++++++++++++++
 test/unittest/options/err.version-pragma.r |  2 ++
 test/unittest/options/err.version.d        |  4 ++--
 test/unittest/options/err.version.r        |  2 +-
 test/unittest/options/tst.version.r        |  1 -
 test/unittest/options/tst.version.sh       | 14 -----------
 test/unittest/version/err.1.1.d            | 27 ---------------------
 test/unittest/version/tst.1.0.d            | 28 ----------------------
 9 files changed, 25 insertions(+), 85 deletions(-)
 create mode 100644 test/unittest/options/err.version-pragma.d
 create mode 100644 test/unittest/options/err.version-pragma.r
 delete mode 100644 test/unittest/options/tst.version.r
 delete mode 100755 test/unittest/options/tst.version.sh
 delete mode 100644 test/unittest/version/err.1.1.d
 delete mode 100644 test/unittest/version/tst.1.0.d

diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 97516517..0a35e852 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -24,6 +24,7 @@
 #include <dt_pcap.h>
 #include <dt_string.h>
 #include <libproc.h>
+#include <port.h>
 
 static int
 dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
@@ -676,18 +677,7 @@ dt_opt_invcflags(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 static int
 dt_opt_version(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
-	dt_version_t v;
-
-	if (arg == NULL)
-		return dt_set_errno(dtp, EDT_BADOPTVAL);
-
-	if (dt_version_str2num(arg, &v) == -1)
-		return dt_set_errno(dtp, EDT_VERSINVAL);
-
-	if (!dt_version_defined(v))
-		return dt_set_errno(dtp, EDT_VERSUNDEF);
-
-	return dt_reduce(dtp, v);
+	return dt_set_errno(dtp, ENOTSUPP);
 }
 
 static int
diff --git a/test/unittest/options/err.version-pragma.d b/test/unittest/options/err.version-pragma.d
new file mode 100644
index 00000000..88825ef6
--- /dev/null
+++ b/test/unittest/options/err.version-pragma.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xversion option is deprecated.
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+#pragma D option version=99.1
+
+BEGIN {
+	exit(0);
+}
diff --git a/test/unittest/options/err.version-pragma.r b/test/unittest/options/err.version-pragma.r
new file mode 100644
index 00000000..279186d3
--- /dev/null
+++ b/test/unittest/options/err.version-pragma.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/options/err.version-pragma.d: line 14: failed to set option 'version' to '99.1': Operation not supported
diff --git a/test/unittest/options/err.version.d b/test/unittest/options/err.version.d
index bd86e13f..093b29aa 100644
--- a/test/unittest/options/err.version.d
+++ b/test/unittest/options/err.version.d
@@ -1,12 +1,12 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 /*
- * ASSERTION: The -xversion option works.
+ * ASSERTION: The -xversion option is deprecated.
  *
  * SECTION: Options and Tunables/Consumer Options
  */
diff --git a/test/unittest/options/err.version.r b/test/unittest/options/err.version.r
index 6cdd1f7f..7c659859 100644
--- a/test/unittest/options/err.version.r
+++ b/test/unittest/options/err.version.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to set -x version: Requested version is not supported by compiler
+dtrace: failed to set -x version: Operation not supported
diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
deleted file mode 100644
index 8b137891..00000000
--- a/test/unittest/options/tst.version.r
+++ /dev/null
@@ -1 +0,0 @@
-
diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
deleted file mode 100755
index 37fb6f75..00000000
--- a/test/unittest/options/tst.version.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/bash
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2023, 2025,Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-
-dtrace=$1
-
-myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
-
-$dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
-exit $?
diff --git a/test/unittest/version/err.1.1.d b/test/unittest/version/err.1.1.d
deleted file mode 100644
index 0b63421f..00000000
--- a/test/unittest/version/err.1.1.d
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-/* @@runtest-opts: -Ze */
-
-#pragma D option version=1.1
-
-/*
- * The following identifiers were added as D built-ins as of version 1.1.
- * Using these identifiers as user-specified variables should be illegal in
- * that and any later versions, but legal in earlier versions.
- */
-int strstr;
-int strchr;
-int strrchr;
-int strtok;
-int substr;
-int index;
-int freopen;
-
-write:entry
-{
-	exit(0);
-}
diff --git a/test/unittest/version/tst.1.0.d b/test/unittest/version/tst.1.0.d
deleted file mode 100644
index 79f23b0d..00000000
--- a/test/unittest/version/tst.1.0.d
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-/* @@runtest-opts: -Ze */
-
-#pragma D option version=1.0
-
-/*
- * The following identifiers were added as D built-ins as of version 1.1.
- * Using these identifiers as user-specified variables should be illegal in
- * that and any later versions, but legal in earlier versions.
- */
-int strstr;
-int strchr;
-int strrchr;
-int strtok;
-int substr;
-int index;
-int freopen;
-
-write:entry
-{
-	exit(0);
-}
-
-- 
2.51.0

