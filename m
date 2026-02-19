Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E002C1589
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771531111; cv=fail; b=RlHmlQ8ke2EuolT0Mp1cAj/07WpQ3yYwyEPzG+EYY8Qx63ObH0PRA4G5UCyB4ALxtRT34H4HDgraliWdbIOPE7WN0Qf+4iQCrPjsv1FU1S9HRwgFMWrji6N1lQ6/hUh1t1pr/EFapK5DBVn0O5+f408jJNof100LcDuOsAQcTuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771531111; c=relaxed/simple;
	bh=rkH72kdegF1yDL/E2EcaZwuqlXdLyL2j5QeKSMCNN2Q=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=nDdzI3zkFWUp9bNutygvPURq/bn2atM5zBNafmutRolfllReAmu3/X/Gx/0l/arUH5rkTlKlNJhkRqAKOdAlOn9Zm0K9AQF/kyJEyWsMpynbzkZmr4xnkozm6v8+1+Opds+PpIX/mkCk7OavEs80iNVKvipWRYbLJ+E30JW1p1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ay2dv/a6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kwnnmfOm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ay2dv/a6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kwnnmfOm"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JJDUDC2444198
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=NNxQtHEXxJ/mBjaqbyFZJ6ui/0dtYvgtAxLb8gv//7U=; b=
	Ay2dv/a6mZYuXFA/se+/Z+R5K+EBt6KUkCKBcMzXxdTVlagRBeTtvcbGCwr+EQ16
	zjtGPX/1jNGcJQAIoi2FQ2yE6ZsvLp6qc+ZAaCSz839ivFRc9b3t0l+f9ojuWrpt
	hPp6KnnEfADoGtxyTjow9qcotxwD3FJwup6cDC1goc41aTxD7Azt6JlFqcAd+Fdu
	rmpMNKJe7iUDgEVWQHJR70DlU7FQFXICZe7eDeRmkZ6LVlo1pLgfuG3C3lgRkCUP
	ijQlZYAF+s2kMbRgejoCy4rgCsQvUpepSlllrjdSMlywAFMpHySpp9pPjoQnMYT8
	hMgALJl194fL0FPG0zUPOw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj3t86kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:58:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JI9cto022943
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:58:27 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2fd2rk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 19:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDFXbNuSgnPy5xuNY+sEp6pQ12fGMMi4lvLASE4ElSgpc6SoBWfjt65J1uvC3U7QcsJx2z5+vE1U8oFvYMBsqAqK0idDZDTpjLRl/XQyHqyvY42kOoGyD6xn3Ahy6bjVGyCgkH3JVfnViwkMHXJ1BqTYIRCNKBwE5ka9M4qeSf7/v9wXpVWIg7J7s50i92lisp4+8C14mfqWPoA7NMleXcwte4cwFQtdB+6wl2MBwo09D+lkX8XoGQbYTqIO108fJjwrdk7Y7lypkh+1fJ3rYGaj9Q1wpJaYuxNPhr32fZE63xIvex3QStW4WEwv4xyZ+/LOa++eNkTvjKitmFnRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNxQtHEXxJ/mBjaqbyFZJ6ui/0dtYvgtAxLb8gv//7U=;
 b=VfGIujs9X2nqtc4BInLYBD7XGvKsFaPtz8qKTG42dZ8K49tZKxDmJNL/tbUwc+4Ixcj1cYb+xbiQwuNAq8XOktkZMdOHLqVwhjN+8dyv6j9QIuQ0fOynpqHwuVYdrQbz7o/xtKs89cNkbkELpaE2NqKhCB0NtrUaCCRNOHOlFph0rEyD23DJJk03YmVFue5K5nkz/r4S1YlbP2qZeEbO06X3G4kH+0m1e0ELuu+kjMVJTrkKE+JOxgn3ebM8tbnS7GJGo4FeAokXTXBTu9gxEDmqyUOK3M7bkAM+HThmL4WJyoodm5OxFcb+l4szWpdshdXDNFq03401zXuwK9wBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNxQtHEXxJ/mBjaqbyFZJ6ui/0dtYvgtAxLb8gv//7U=;
 b=kwnnmfOmDFACmDucc3dwDYwLjE7yoRFL1rYhNps0efPUnop0A68hp6JzrZqIeVvurR3Y5uNlACH34JavffWXMILpAye6EkrtVtKxZMQQslfyuvMpQf8IWJGImbwZs4ZmSV22mIlTqLmqi23qo2Dgc8yedy8cdlM7viKB0lhq4XE=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH0PR10MB7097.namprd10.prod.outlook.com (2603:10b6:510:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 19:58:22 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:58:22 +0000
Date: Thu, 19 Feb 2026 14:58:20 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6] Add packaging configuration for Debian
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75223FD05480C479A3CFCBA8C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH0PR10MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 3464c890-ccd3-4d06-4a61-08de6ff13c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4djLcKxk7nG4QGqTZww9vy4SKFQJiHZdig0W1a4iJlwrlRXly76LPP4HqfDE?=
 =?us-ascii?Q?fXpeUoRE+Eol4qF9lke4+8Lxy3n0rzYVbjnCpcZ6OLfGkv2FcTHi0ROcyhva?=
 =?us-ascii?Q?/S7AlKzITBTlq0hdy8XaKPi4P1ndombHL8pIbxPK/oIkYtsAA32441MPc0EC?=
 =?us-ascii?Q?IxhdkXcGmDgLqFEOZKYaH24TB05ss8Ek1lpPH/aqgxIgXo0iwp5d2mnGGtC1?=
 =?us-ascii?Q?0TXOmmLb8ZSr82h3wZXIJZfkv1FU9rnvctpoYeekOCNTQm73+3PTLpJCkBma?=
 =?us-ascii?Q?6W6PYUHVyhC14nqOcnI/inzYLl57yE6GAhxVmdXbQ2MNXY9xju//feDh7nHe?=
 =?us-ascii?Q?LVkPfPEu3vf15ZCUZPo4hX8L3n9xqrAOGorXeEea3FoUwxvqkeNnspm1xNaV?=
 =?us-ascii?Q?ShaFrGrv6HSb4CNTjDdUBAJ2YjNE1+59ctUQYNOKSWBnymRvopxeRzSK3XPB?=
 =?us-ascii?Q?+tWmdfvj4g9EYTe3xN2eCM7tFEFKtXXEfkJ3IZ+N++q6t8T8MnpviJFFDHeo?=
 =?us-ascii?Q?1YMQ+rqq46f3MwT59q3CswSNpiGIiHl5VzGACbom5SdAcLU3fJoht2vFZOmm?=
 =?us-ascii?Q?6Ey8rPqMgUaHcJjVghteRDzu98feadxzdjSsPu8yED0XochWsDFakJofvbCs?=
 =?us-ascii?Q?nDNud4lalAtWgVzxY3PDwzRmkJMjlwo15RqapPr1ufP0W6z6R5USLyJwJD1T?=
 =?us-ascii?Q?SIcbmHAHFU2Cz1X0SvEWLNpz/LGXCh579FOpZ77gU5Wn2KW18T459d0ImChI?=
 =?us-ascii?Q?0MDJ4Rv4LksWD5MzWpe7Iqhu/FzVUJ8OPv29LVJNkOdkd4/TebbDOoJPAiwp?=
 =?us-ascii?Q?4y8jRj+gHzxWTvZK7bYt2kY1xcG8NSXv/BjnV3sAlTlBQIe3Ft9Rr95JzdC2?=
 =?us-ascii?Q?FqsC41RZt3VlEJsCu3IqtiKd1jNNB6NV16Rb2uV8rdsgS06uO2HdGfC5LXsy?=
 =?us-ascii?Q?ZuNUC9uunrrxLDasNK7YsnviycsHHAObDnq3puvpLrvMKPIDGB1gbEgjE48e?=
 =?us-ascii?Q?z6alcWlEkhrlubXYuOo2Mo4Nc0d/QMDXLVk+EYfwaBvyUsQBARRBLk006Gjv?=
 =?us-ascii?Q?POkF0tV5AzgUMRK0xRFpAAz+rAAgrT/P927lnEotjEvz+FcbQA3hFaekbSkb?=
 =?us-ascii?Q?MnHiwxJdXTyy7qm1dNeAE8vVzB4s2UzCGNkqrWGJr/MTTHW96iQVHEULrXOM?=
 =?us-ascii?Q?tS9MB+Hudd7zk+hCQxSdkhLBgSQF3057EUZ5Q8pi2NFCXK3h/sm/63qfTiUM?=
 =?us-ascii?Q?SF+TnFE0tDFrNXR9tjlAeKnkM1+GAQLakaRmir5UI9AkAnD7uObfnSuZlXpy?=
 =?us-ascii?Q?ruLHXvdOryj0Cu5XAjcjsjo1o6nEAgnXvT9Q+vuSOHXNauFAEufDzHzl48C0?=
 =?us-ascii?Q?6FazjRBj103G8tB5f7alOOfNr6rVjyyZYAf2zne+mF2i1p5j/RgF5NaaRZQJ?=
 =?us-ascii?Q?pF09IKyw/+g/AtM7zj4rri0dj3vCWW4Qc9UweGoyWZFgKnLCRw0tkbOHx2o0?=
 =?us-ascii?Q?+57jT3aOcjVGxCg4rMlV038b62YXlO72CZCR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9GZ9qWSTDWnKIvrlYM0cZLJq2tnTB/CCdl5P25m2ZLbDAQL0aBc+9FwnM8E?=
 =?us-ascii?Q?n0dX2N5C7L6+nBSvH4Eh+JFIQdfze4NwRUxz5LULzK044YLK9nMyTXrtpk+e?=
 =?us-ascii?Q?xN+idZhKtCvqfoeyml53Wf4v0kUdQGPolSyOTDESFPw0ESpVTKWAzz6+SgWx?=
 =?us-ascii?Q?qpi5iVVr1mH3LRBQzZbul2csYtvg6jWclMtXUIY+TB4cPw06S3PU2h/5d62s?=
 =?us-ascii?Q?ceRfUt2pNOGci8X6okZED+IC9jQh0Y4lI3sh0IXFn2oaC+pDeDua2iVaFvGB?=
 =?us-ascii?Q?J4Jc9/in0VYmCG9393K7ENKFiavspNpuUpqnYZXEZWmkvgR+fjtbMZUYJ1aN?=
 =?us-ascii?Q?WtbKhk9J2iQSHHROb5n7H9uhU3XTSadOM6DHYkOMijuP1RHoPPIPjX45eu2q?=
 =?us-ascii?Q?jD5IASd7ZQ8c9+7tEMEcQ2eFsQVgJKTHO/xmlwWD3styYBpwloNR3FEivu15?=
 =?us-ascii?Q?RnLo17e2tgN1JB0hGeiBrdGxVNSWHBff3a10GKIK0qb+R8lU25PABsVHgt9R?=
 =?us-ascii?Q?pU7Q+Fmvcc6cu/cUdpD4fgyNIcb12Ju9jTH5AUrQyFxyREM2P+Teeor9CTZF?=
 =?us-ascii?Q?idVvF5HKLoxy4VkwVoHkhRdC6Twno7C2Acf3s0DPtJ8K2c6DJ8V0plANy8Ke?=
 =?us-ascii?Q?bpMygNjjwI24EWrSAWP8vv16nwVOK3Pb08dh5+b/LTNkPHCxyuW3XYJGK9yk?=
 =?us-ascii?Q?c4MfCBiBCtDsyhOnVvqkDzKidPuGS8vT2MtEEh2orqbpKCGOwg78a07NeZ6S?=
 =?us-ascii?Q?D/VQysWlk0Xf8mXUGWZ3AL1zm9VhYbdmS72vIgVZuwvoSuglouWtW6MS32oz?=
 =?us-ascii?Q?Wu1v1mPcsc2k/8cHdcfEuV0hJCL1XIUsqh45OgGmdHH/SbYbmZRuijinEIvn?=
 =?us-ascii?Q?asyqaL3iGdMFA0JeE2qtbjEI5sCVlOOU0XWfRHjgcUyq7rb9dzQEobmCV0/C?=
 =?us-ascii?Q?B6hiXQgmrGzetyGgTHxWg9sjCZJ4IT6uvvIqkPepYgcOSbVyo9e4bYSkr1ny?=
 =?us-ascii?Q?3cVh3Bt8bOHr+j9wOTxzCKi4abgSfozooCz6ndHr6pYB+2joi5eFbG0deHC4?=
 =?us-ascii?Q?bfNom9FWrdmr/VgbNHaljGNPQUz9bmsMquxxmoE/re3cC4xko3K8+0HjuVlH?=
 =?us-ascii?Q?2MKfaZ62IHs1fZ2Mhkh2M2Qa3xOb/YFYp6M1k3zmF1kKqdHUgPAGdGx+ldPx?=
 =?us-ascii?Q?cs4DJw0m46VSCLA7Rpbu+Z0/tPTU+8FV9q+jqB3XQ9hoRpa5vsO/ls+bE+5l?=
 =?us-ascii?Q?1COvw4VN76xzKC6ef+FCgPhYvmVgLaVC8fP3oYIAKr06MgMqe0LwqAsMnLVT?=
 =?us-ascii?Q?UorwH/CO7SXkExZ1uklqdYEJitsH2K3rbsECrngw9bWlo9Z1Db5oLN92Ly6R?=
 =?us-ascii?Q?Dp7qjYpeL9XmDXSr95sR5L/aUhRfjCEBDc3FebtMi+M6yWBM8Xx13U5cLJKV?=
 =?us-ascii?Q?s+/BMykYx/xs0icAnHRKcZpEiVhCmN4+3Rgzrw65IVuF7Kz2FJl9k0lsRm3V?=
 =?us-ascii?Q?6ywTBcTOBfWu6MiyR6HOiqVgqz7BNev7cyp8CHLB59P9zoC77J2wXaAQlgRP?=
 =?us-ascii?Q?gau/mA88aVK7bqg24wfS4w7KU7x4NAOis8JFikC/0rM3ms83yZP+kTejHqGV?=
 =?us-ascii?Q?cYW99gDvlugfsIKMQkp3OF5KdhJ/MGoXWuq1nrkmyHRJhwCfuaYNldJutIYX?=
 =?us-ascii?Q?Y0GF+al250NyvzQttTXV5eMf2S5DPaULiVzIcDvFNagykPZidyE7zRB8YaST?=
 =?us-ascii?Q?LRWcQH/FaA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vpgFmKCyDZ7yfg5yfXI/Xb3dgvgJAK+tOXWYucvmzmvIVOVG4aGMSgc+g39wu6/WlmSXQG63358l5Vl5zvGoCgxCEoxDRr32v6qhjD0XC6b88XN28onJHJ+1xJqSwVQzJpe8tBx4dwiMtLie/mIEE3tHlN6AuTYTFFZZQazesePfkJ2oqaIR5y0Udtj/JLTO2p2Tx7CS0yYPxpcUV/5BtgOh906TxjSLjJ4eiCK4Eimm5nQqol/U3ve12osr93O1NS1ycr8eyVie4OvrzQrtgEU9fyYHQAfReIlvfZ0JgcS2TDPL3qfRG/3ByYFplm1ixLQ7tB1CUIGIqJOeXDVxdJpuhKT1V1VcSBswOctNjUqrLIKqra4/xn5yfLQh61rtf9JsF4Bmhan3gk4qOMMq/i3ah38PZKvKIa2PvjJQJb7gewlnMnRMM/ns4ZxXPa3QS2MgjN/y3zTfLEcUXGWLBxxTiotjJISbPeRJxO7h8gtucgGBnIV9QqvRw3/bEiWISkGs95awaqVX1Qt947Q4pM/Iu3trMphTmhL5xzXMgyVYIFeVueCqPeqKkA96sP6835rdPURGUdHEB4F28kN+ZVvvp/1iJCKPIK4HrnaFiiQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3464c890-ccd3-4d06-4a61-08de6ff13c37
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:58:22.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzFgGHKRCw/y7J1BsMG8CW79joIWFlVk9S/kREwhaGChDir/K1GzHbW6hWz/Qbdgnmk4YSvANIPHMJMiqgQb3pQY5jUtu3GvOn9I/HIE7I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE4MSBTYWx0ZWRfX77iIT/lt4kri
 nVDFN47B5HHqDUav4cnAfqgVAT8rRClBMPzUnqE8FvqxzyO4YBhIOk8tpBX+q0xraKLJ/aTpu3+
 0yHWvZ9aeJiJnoe2Y/GzVkox8v+4oyc4+TFJXMuuKNkNMpEA1yygLF4O9w9HJjeZM8DlkrIlH0B
 +LzWcAMKHFrUFMi7PHEUj4lxCct37F1/3o8YJjKYA+/qiqdK9IR1xubpvvitXTDlxULkDlZA8i8
 8x30xDnxgdM78Xdp8I8J53hripu+q2Tsr2bx0N7RIIjMbSqZnpI7B5/ltijVY483RzHAaa1IocT
 P9M7VDU8exZUDtYV6FI24H+9GZbVHd14X0n8ipq5avl0OzaLcfhp5f0tAetJHNCg8U2mB6el77c
 9CQHqae9oOAz7wiDxKZ7g7ldewGrtiK+t+/VUBiaI6wTPxPGIl0r4T0VFF/v73GQ7jXKxA3Ukfr
 e/Dtc8E1urFJcqixRypfyNcJBNmlcyzxKTKIX3fI=
X-Proofpoint-ORIG-GUID: snt5JOorHbE2mDUpJ9wVdplGBZqLl1B4
X-Authority-Analysis: v=2.4 cv=b/S/I9Gx c=1 sm=1 tr=0 ts=69976b64 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=Ixkok3qfAAAA:8 a=mDV3o1hIAAAA:8 a=HjyykGy0qQJcHIbvWqkA:9 a=3ZKOabzyN94A:10
 a=_4Lj5ymMnAn2NA9aJKr1:22 cc=ntf awl=host:12264
X-Proofpoint-GUID: snt5JOorHbE2mDUpJ9wVdplGBZqLl1B4

Packaging configuration files for Debian are provided in dists/debian.

Sample steps to build DEB packages:

 - make dist
 - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
 - cd $D
 - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
 - cd dtrace-x.y.z
 - make prep-debian
 - debuild

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dists/Build                                 |  16 ++
 dists/debian/control                        |  74 +++++++++
 dists/debian/copyright                      | 103 ++++++++++++
 dists/debian/dtrace-tests.install           |   1 +
 dists/debian/dtrace-tests.lintian-overrides |   8 +
 dists/debian/dtrace.docs                    |   1 +
 dists/debian/dtrace.install                 |   1 +
 dists/debian/dtrace.lintian-overrides       |   1 +
 dists/debian/dtrace.manpages                |   1 +
 dists/debian/libdtrace2-dev.install         |   5 +
 dists/debian/libdtrace2.install             |  12 ++
 dists/debian/libdtrace2.lintian-overrides   |   4 +
 dists/debian/libdtrace2.manpages            |   1 +
 dists/debian/mkChangelog                    | 174 ++++++++++++++++++++
 dists/debian/patches/debian-configure.patch |  17 ++
 dists/debian/patches/series                 |   2 +
 dists/debian/rules                          |  24 +++
 dists/debian/source/format                  |   1 +
 18 files changed, 446 insertions(+)
 create mode 100644 dists/Build
 create mode 100644 dists/debian/control
 create mode 100644 dists/debian/copyright
 create mode 100644 dists/debian/dtrace-tests.install
 create mode 100644 dists/debian/dtrace-tests.lintian-overrides
 create mode 100644 dists/debian/dtrace.docs
 create mode 100644 dists/debian/dtrace.install
 create mode 100644 dists/debian/dtrace.lintian-overrides
 create mode 100644 dists/debian/dtrace.manpages
 create mode 100644 dists/debian/libdtrace2-dev.install
 create mode 100644 dists/debian/libdtrace2.install
 create mode 100644 dists/debian/libdtrace2.lintian-overrides
 create mode 100644 dists/debian/libdtrace2.manpages
 create mode 100755 dists/debian/mkChangelog
 create mode 100644 dists/debian/patches/debian-configure.patch
 create mode 100644 dists/debian/patches/series
 create mode 100755 dists/debian/rules
 create mode 100644 dists/debian/source/format

diff --git a/dists/Build b/dists/Build
new file mode 100644
index 00000000..c75f9332
--- /dev/null
+++ b/dists/Build
@@ -0,0 +1,16 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dists_DIR := $(current-dir)
+
+# Prepare package building on Debian (copy ./dists/debian in ./debian, and
+# generate the debian/changelog file.
+
+prep-debian::
+	$(call describe-target,DIST-PREP,Debian)
+	rm -rf debian
+	cp -rp $(dists_DIR)/debian .
+	debian/mkChangelog debian/control dtrace.spec > debian/changelog
diff --git a/dists/debian/control b/dists/debian/control
new file mode 100644
index 00000000..a5e1cff3
--- /dev/null
+++ b/dists/debian/control
@@ -0,0 +1,74 @@
+Source: dtrace
+Section: utils
+Priority: optional
+Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
+Build-Depends: debhelper-compat (= 13),
+ bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
+ libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
+ libpfm4-dev, libsystemd-dev, libz-dev
+Standards-Version: 4.7.3
+Homepage: https://github.com/oracle/dtrace-utils/
+Rules-Requires-Root: no
+
+Package: dtrace
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends}
+Description: Dynamic tracing for Linux (DTrace)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+
+Package: libdtrace2
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends},
+ fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
+Description: Dynamic tracing for Linux (DTrace) (library)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the shared library.
+
+Package: libdtrace2-dev
+Architecture: any
+Depends: ${misc:Depends},
+ libdtrace2 (= ${binary:Version})
+Description: Dynamic tracing for Linux (DTrace) (development)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the development files necessary to develop
+ alternative implementations of the user interface for libdtrace, i.e.
+ replacements for dtrace(1) itself.
+
+Package: dtrace-tests
+Architecture: any
+Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
+ binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
+Description: Dynamic tracing for Linux (DTrace) (testsuite)
+ This is the official Linux port of the advanced tracing tool DTrace.
+ .
+ DTrace is a high-level dynamic tracing tool for Linux, built on kernel
+ tracing features (tracepoints, function probes (fentry/fexit), dynamic
+ kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
+ leveraging BPF as execution engine.  It features an integrated compiler
+ for its high-level tracing language and native support for interacting
+ with the BPF engine, significantly reducing runtime dependencies.
+ .
+ This package contains the testsuite.
diff --git a/dists/debian/copyright b/dists/debian/copyright
new file mode 100644
index 00000000..475f9bac
--- /dev/null
+++ b/dists/debian/copyright
@@ -0,0 +1,103 @@
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+Upstream-Name: dtrace
+Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
+Source: https://github.com/oracle/dtrace-utils/
+
+Files: *
+Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+Files: include/linux/bpf.h
+Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/linux/btf.h
+Copyright: Copyright (c) 2018 Facebook
+License: GPL-2 with Linux-syscall-note exception
+
+Files: include/sys/auxv.h include/sys/bitmap.h
+Copyright: Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T
+License: UPL-1.0
+
+Files: include/sys/glibc_internal_link.h
+Copyright: Copyright disclaimed (all content required for interoperability)
+License: LGPL-2.1+
+
+Files: libproc/libproc.h libproc/Pcontrol.c
+Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
+License: UPL-1.0
+
+License: UPL-1.0
+ The Universal Permissive License (UPL), Version 1.0
+ .
+ Subject to the condition set forth below, permission is hereby granted
+ to any person obtaining a copy of this software, associated
+ documentation and/or data (collectively the "Software"), free of charge
+ and under any and all copyright rights in the Software, and any and all
+ patent rights owned or freely licensable by each licensor hereunder
+ covering either (i) the unmodified Software as contributed to or
+ provided by such licensor, or (ii) the Larger Works (as defined below),
+ to deal in both
+ .
+ (a) the Software, and
+ (b) any piece of software and/or hardware listed in the lrgrwrks.txt
+ file if one is included with the Software (each a “Larger Work” to which
+ the Software is contributed by such licensors),
+ .
+ without restriction, including without limitation the rights to copy,
+ create derivative works of, display, perform, and distribute the
+ Software and make, use, sell, offer for sale, import, export, have made,
+ and have sold the Software and the Larger Work(s), and to sublicense the
+ foregoing rights on either these or other terms.
+ .
+ This license is subject to the following condition:
+ The above copyright notice and either this complete permission notice or
+ at a minimum a reference to the UPL must be included in all copies or
+ substantial portions of the Software.
+ .
+ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+ OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
+ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ Licensed under the Universal Permissive License v 1.0 as shown at
+ http://oss.oracle.com/licenses/upl.
+
+License: GPL-2 with Linux-syscall-note exception
+ This program is free software; you can redistribute it
+ and/or modify it under the terms of the GNU General Public
+ License version 2 as published by the Free Software Foundation.
+ .
+ On Debian systems, the full text of the GNU General Public
+ License version 2 can be found in the file
+ `/usr/share/common-licenses/GPL-2'.
+ .
+ NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+ .
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+License: LGPL-2.1+
+ This file is part of the GNU C Library.
+ .
+ The GNU C Library is free software; you can redistribute it and/or
+ modify it under the terms of the GNU Lesser General Public
+ License as published by the Free Software Foundation; either
+ version 2.1 of the License, or (at your option) any later version.
+ .
+ The GNU C Library is distributed in the hope that it will be useful,
+ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ Lesser General Public License for more details.
+ .
+ You should have received a copy of the GNU Lesser General Public
+ License along with the GNU C Library; if not, see
+ <https://www.gnu.org/licenses/>.
diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
new file mode 100644
index 00000000..a04ebfb9
--- /dev/null
+++ b/dists/debian/dtrace-tests.install
@@ -0,0 +1 @@
+usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
new file mode 100644
index 00000000..22cbd6eb
--- /dev/null
+++ b/dists/debian/dtrace-tests.lintian-overrides
@@ -0,0 +1,8 @@
+dtrace-tests binary: unstripped-binary-or-object [*]
+dtrace-tests binary: unusual-interpreter dtrace [*.d]
+dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
+dtrace-tests binary: executable-not-elf-or-script [*.d]
+dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
+dtrace-tests binary: statically-linked-binary [*]
+dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
+dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
new file mode 100644
index 00000000..7696583d
--- /dev/null
+++ b/dists/debian/dtrace.docs
@@ -0,0 +1 @@
+usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
new file mode 100644
index 00000000..6be68ccb
--- /dev/null
+++ b/dists/debian/dtrace.install
@@ -0,0 +1 @@
+usr/sbin/dtrace
diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
new file mode 100644
index 00000000..11005f4a
--- /dev/null
+++ b/dists/debian/dtrace.lintian-overrides
@@ -0,0 +1 @@
+dtrace binary: unstripped-binary-or-object [*]
diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
new file mode 100644
index 00000000..e54b52b3
--- /dev/null
+++ b/dists/debian/dtrace.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtrace.8
diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
new file mode 100644
index 00000000..b5e66db5
--- /dev/null
+++ b/dists/debian/libdtrace2-dev.install
@@ -0,0 +1,5 @@
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
+usr/include/dtrace
+usr/include/dtrace.h
+usr/include/sys/dtrace.h
+usr/include/sys/dtrace_types.h
diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
new file mode 100644
index 00000000..36294de3
--- /dev/null
+++ b/dists/debian/libdtrace2.install
@@ -0,0 +1,12 @@
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
+usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
+usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
+usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
+usr/lib/systemd/system/dtprobed.service
+usr/lib/systemd/system/dtrace-usdt.target
+usr/lib/systemd/system-preset/50-dtprobed.preset
+usr/lib/udev/rules.d/60-dtprobed.rules
+usr/sbin/dtprobed
diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
new file mode 100644
index 00000000..34b4011d
--- /dev/null
+++ b/dists/debian/libdtrace2.lintian-overrides
@@ -0,0 +1,4 @@
+libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
+libdtrace2 binary: unstripped-binary-or-object [*]
+libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
+libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
new file mode 100644
index 00000000..fef53dc3
--- /dev/null
+++ b/dists/debian/libdtrace2.manpages
@@ -0,0 +1 @@
+usr/share/man/man8/dtprobed.8
diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
new file mode 100755
index 00000000..69958dca
--- /dev/null
+++ b/dists/debian/mkChangelog
@@ -0,0 +1,174 @@
+#!/usr/bin/awk -f
+
+#
+# This script can be used to convert the dtrace.spec into a Debian changelog
+# file.  It is intended to be invoked from the 'prep-debian' make target, but
+# it can be used manually as well:
+#	mkChangelog debian/control dtrace.spec > debian/changelog
+#
+
+function error(msg) {
+	print "E:"msg >"/dev/stderr";
+	err = 1;
+	exit(1);
+}
+
+BEGIN {
+	if (!dist)
+		dist = "UNRELEASED";
+	else if (dist != "unstable" && dist != "experimental")
+		error("Bad dist ("dist")");
+}
+
+/^Maintainer:/ {
+	sub(/^Maintainer: +/, "");
+	m_name = $0;
+	i = index(m_name, " <");
+	m_mail = substr(m_name, i + 1);
+	m_name = substr(m_name, 1, i - 1);
+
+	nextfile;
+}
+
+/^Name:/ {
+	pkg = $2;
+	next;
+}
+
+/^%changelog/ {
+	in_changelog = 1;
+	next;
+}
+
+!in_changelog {
+	next;
+}
+
+function lineWrap(p, s, line, len, l, n, m, i) {
+	n = length(p);
+	line = p;
+	len = n;
+
+	m = split(s, arr, / +/);
+	for (i = 1; i <= m; i++) {
+		l = length(arr[i]);
+		if (len + 1 + l >= 80) {
+			print line;
+			line = sprintf("%*s %s", n, "", arr[i]);
+			len = n + 1 + l;
+		} else {
+			line = line " " arr[i];
+			len += 1 + l;
+		}
+	}
+	delete arr;
+
+	print line;
+}
+
+function emitEntry(i, j, n) {
+	# Loop through the contributions, determining who each contribution
+	# should be credited to.  If there are multiple contributors, we pick
+	# the first one who is not the commit author (if any).
+	# If all contributions are from the commit author, we do not emit an
+	# explicit credit line.
+	for (i = 1; i <= lc; i++) {
+		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
+		sub(/[ \t]+$/, "", lv[i]);
+		gsub(/  +/, " ", lv[i]);
+
+		cont = name;
+		if (match(lv[i], /\([^)]+\)$/) > 0) {
+			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
+			lv[i] = substr(lv[i], 1, RSTART - 1);
+			sub(/[ \t]+$/, "", lv[i]);
+			n = split(auth, arr, /, */);
+
+			# Find the first contributor not the commit author.
+			for (j = 1; j <= n; j++) {
+				if (arr[j] == name)
+					continue;
+				cont = arr[j];
+				break;
+			}
+			delete arr;
+		}
+
+		# Add to the list of contributions for this contributor.
+		if (cont in map)
+			map[cont] = map[cont] " " i;
+		else
+			map[cont] = i;
+	}
+
+	print pkg" ("vers") "dist"; urgency=medium";
+
+	# First emit contributions by people other than the commit author.
+	n = 0;
+	for (cont in map) {
+		if (cont == name)
+			continue;
+
+		n++;
+		print "\n  [ "cont" ]";
+		$0 = map[cont];
+		for (i = 1; i <= NF; i++)
+			lineWrap("  *", lv[int($i)]);
+	}
+	if (n > 0)
+		print "\n  [ "name" ]";
+	else
+		print "";
+
+	$0 = map[name];
+	for (i = 1; i <= NF; i++)
+		lineWrap("  *", lv[int($i)]);
+
+	delete map;
+
+	if (m_name) {
+		name = m_name;
+		mail = m_mail;
+		m_name = m_mail = 0;
+	}
+	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
+}
+
+/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
+	date = $2", "$4" "$3" "$5;
+	i = index($0, " - ");
+	vers = substr($0, i + 3);
+	name = substr($0, 19, i - 19);
+	i = index(name, " <");
+	mail = substr(name, i + 1);
+	name = substr(name, 1, i - 1);
+	if (name == "")
+		error("No name in: "$0);
+
+	lc = 0;
+	delete lv;
+
+	next;
+}
+
+/^- / {
+	sub(/^- +/, "");
+	lv[++lc] = $0;
+	next;
+}
+
+NF == 0 {
+	emitEntry();
+	date = "";
+	next;
+}
+
+{
+	lv[lc] = lv[lc] $0;
+	next;
+}
+
+END {
+	if (date && !err)
+		emitEntry();
+}
diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
new file mode 100644
index 00000000..f8a6a698
--- /dev/null
+++ b/dists/debian/patches/debian-configure.patch
@@ -0,0 +1,17 @@
+Description: issue a warning for unknown configure options
+ The Debian build system specifies configure options that are not known to
+ the DTrace configure script.  They should not cause the configure script
+ to abort.
+
+--- dtrace-2.0.5.orig/configure
++++ dtrace-2.0.5/configure
+@@ -188,8 +188,7 @@ for option in "$@"; do
+               echo "Unknown option $option" >&2
+               exit 1
+            fi;;
+-        *) echo "Unknown option $option" >&2
+-           exit 1;;
++        *) echo "Unknown option $option" >&2;;
+     esac
+ done
+ 
diff --git a/dists/debian/patches/series b/dists/debian/patches/series
new file mode 100644
index 00000000..6176df36
--- /dev/null
+++ b/dists/debian/patches/series
@@ -0,0 +1,2 @@
+# You must remove unused comment lines for the released package.
+debian-configure.patch
diff --git a/dists/debian/rules b/dists/debian/rules
new file mode 100755
index 00000000..8646ac1a
--- /dev/null
+++ b/dists/debian/rules
@@ -0,0 +1,24 @@
+#!/usr/bin/make -f
+# You must remove unused comment lines for the released package.
+export DH_VERBOSE = 1
+export DEB_BUILD_MAINT_OPTIONS = hardening=+all
+export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
+export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
+
+include /usr/share/dpkg/pkg-info.mk
+
+export DEB_VERSION_UPSTREAM
+
+%:
+	dh $@
+
+override_dh_auto_configure:
+	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
+
+override_dh_strip:
+	dh_strip -Xdtrace
+
+override_dh_auto_test:
+
+override_dh_auto_install:
+	dh_auto_install -- install-test
diff --git a/dists/debian/source/format b/dists/debian/source/format
new file mode 100644
index 00000000..163aaf8d
--- /dev/null
+++ b/dists/debian/source/format
@@ -0,0 +1 @@
+3.0 (quilt)
-- 
2.51.0

