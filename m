Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D741898FB
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324512; cv=fail; b=T4Rlz40KSxtmfuOyG5dJwoDJ6k2EaV43KDY9KuUOYGISM2hMePg3FGNFS0ZmRKcJE46JjxK11SneLdovOluwZ15AS228VYeowINfp2BfPj3ZOkN1cY8v0elRSpZrnZcxksvdAbFR9/khl+bl+qodoxrGu2l4cvJXZVY5gUOvM1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324512; c=relaxed/simple;
	bh=5QfzyPVHmr6u4Oq+yQN09MAx6lUYSfIpifgfdvQPZik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aDovXm4F/zVr/OIk9CxXpbZzjvhMEaUtqa1iEqwxNUKgcWljp3t3cLryWm5NvFpyvNtWfh0sKcygZSNu1FlHLRkiXgk8RNcg3Mb10UHBNA3BzQdIzTUjc5iEr7y5Ef4gDHIrjVBQ/BtDwEb0dNEjm/AMybQtRRJowt+pLTgeI7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nCki04/L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MjGBdoiy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nCki04/L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MjGBdoiy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IItnJw028729
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=No/mBwKulFONVkLeH+
	XT+yW5Ol5nnle1XreHxZPtHDg=; b=nCki04/L3a7i7fvZU8tnFs2d0DPwHfboqy
	Ahhf9sKxAyuAyeSUpLF56tLhkIETI817fpjSLkOWlgGkhTcGaQ1gJl/xd7QHHO0l
	ixiKlO0saVKx2/GBLyIQFy6cUwDiVq0EXaS/1HSES5dTiTe8XNc1ltthoPMk8OpI
	2rJaRN4yABuFtrZSbwBpxOn+x9R24DOdKXNK1F3QKJ4t9+W/1TyOkZK0056RoTK1
	mOvk72mnyZOGp9EuJq3S9LpK2fpNB/bEC+37kUcT8+vBiNt+pzEejQrtpi6u1aJX
	+Le1lXMYaMV+WhAHp3C1rQKImq1v1+HhK8tI2St77ikaf/U0dK1g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d23rwx1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:01:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJ0xvG008935
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:01:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxm0322u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:01:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFuujQTOM+aX00fFePpFCnPhXG3Mnt/tJc2LxcNT5Xltv5KIl6A4XI6VgLZZRx8EIvGIgmq9Z7zn6U+do7tjlJDJe+vSRbzdu0Q5QSmYxg8JrxtzOHU15WNZrYRLUtZRM64sRD1bQh33KLDiJDlJzVOHxC+P4leBZDeFXAzwUBznNmttqi9qb5+NvY4NuhgZl6500kweXRztcE8aFx/k2xBVHoLLPxjo3WWh5cBVmtjsjLIDb88tIF0J0G9jhWhbQaTvsqw1KtRmDxB7ryp5IEKwnsLrUoFwKnMcmS14lfAuu+10U2J2NKNMTmTO7+YI73vDcq8+QaJpqImMteiZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=No/mBwKulFONVkLeH+XT+yW5Ol5nnle1XreHxZPtHDg=;
 b=einwHqFpWJ2et5pV8TQyU6bhl48uuFGG0rr3ftCyne9YU9SJDPhkmRRcsUHcItElAHY3pdMTu0DuD8aicIirLq3Sc+ZtcVEPQAH1ouTUGKeD6pEDUhe0GoQ+YekQue+nYKjBqYcJbsawvwt+YpgACR1siCMJHxeQZPSyhdk/7DMSB+oI2+hYpDI9u/b8G5DMHaqmH5ppoy8VEJ1Gu0AwNmU97sH65NUwvRuAKTV4vFuMkNpqzPiosJQibgGl2VoUwejXJsC7EouswfYWcE084x9yjOhryglCheDorwEOP7Cok8ErXXK+sDjmx5hLRz0hvenDn9uWUY3S7ThoKGVj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No/mBwKulFONVkLeH+XT+yW5Ol5nnle1XreHxZPtHDg=;
 b=MjGBdoiyyWRBabTk1zKjX7CDmO9RLBZLHXdctAky3Wn8y4NZgmXhFRUdUVvkS0BwYtKYnaQFSIAq12oK5k8t859SU7mjahn/Pzoq+jwhRs2FwXx4ButzFyitGJxwQRUy23jQJix8GZfb+3SVK9heWTxzRZfP9OUAP9ZrwT+j7SE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4538.namprd10.prod.outlook.com (2603:10b6:806:115::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 19:01:43 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 19:01:42 +0000
Date: Tue, 18 Mar 2025 15:01:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] tests: add test for buggy deduplicator
Message-ID: <Z9nDEyCTQxsTf3iq@oracle.com>
References: <20250109164711.232013-1-nick.alcock@oracle.com>
 <Z9m41r6P8HPZY0wC@kvh-deb-bpf.us.oracle.com>
 <38e69a45-1a32-50c1-0eef-bcdf8cf10348@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38e69a45-1a32-50c1-0eef-bcdf8cf10348@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a09e90-6590-4958-5315-08dd664f5257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jcYGEx1PWoIK6xWXDawDoo1gYOZSGSBz+DV925t+CUSwI/MEyvN+y6A/0E2M?=
 =?us-ascii?Q?8iKSUTZL32Jw1yWyPULpDuH3u7utgDO1BGWRARlkttLfOBGNX+OtZsO5JCpj?=
 =?us-ascii?Q?UQaOXPOvJjHKk2pSAlWJmSKJxhdxqhF0CTmJKGnaiGVC++tR667J7Z2BrXBY?=
 =?us-ascii?Q?1aD+e4ELh8KmExkStSmA8QmaUpHmzCCPk4CqrPs6wLYRnvMQFAyBUROi0Dos?=
 =?us-ascii?Q?3WseAEEk2asn1E4ao7GDvRiTZSvd28jH09d/wp0KdFf6SDzag1UZjq/G305+?=
 =?us-ascii?Q?SYht9FPHoemr/drMwqxqdlrJvOrjHWYz55uSKcjHo/pBAI+R7sM81FD4kVYJ?=
 =?us-ascii?Q?iLQEhGRhc4CkC7FJMQjrt6aXP8yidb14+nFt92MjF7dhgEcNGLuyoR+PHEET?=
 =?us-ascii?Q?jVdT3KW87alq2Z+P7c4zh0WJS+1OdpaMqPybn/87idDrpbDDht7toiKxDww1?=
 =?us-ascii?Q?oBJ2jBp2LOe6tfF6xeZwkPEtXf4wZFu2zKN6tck0Z+v82cLHNSzjyzESgSyg?=
 =?us-ascii?Q?NI4ZFbPSTskPtezkHafY61ypheVAEFwelkooOcrNUCXHHIwsUe2wsxAETZAb?=
 =?us-ascii?Q?kzvBLGrq4Jwmsom+VN1MSLHh3eeB3xB1/ng1Ul8drXboA3EqRVHl6dixHL9E?=
 =?us-ascii?Q?N7iaer86IN+D5Mg3RJi89SSa/oFvnjasIRaM1C70fLoJaSjN+9zYe0FLszhz?=
 =?us-ascii?Q?h4Zhm/X7UXu6/FZqgh7qBwyJuKEtpnzmZzse1bltcA9D+IJJxzEoTFtkpLh2?=
 =?us-ascii?Q?KFLVDzUv3stGDigKfRGJM+UZCMNAh179RT3slzPnffz/omEj1gXqZTBj7tEr?=
 =?us-ascii?Q?3lRvm2P3g8f7M0dYVWyyJwxjg5y+tx+9L3VMC+9YEfIZn9eiGRevHtt2gHKp?=
 =?us-ascii?Q?1IXkzopMf0hf8QmTJx8DmI/Hg4Hi0dB2Tt+ISmFDhKKI4EsMl3cm1cnkZpAB?=
 =?us-ascii?Q?jzlJZVjFJt98oql2kJ4+t+TtSla7iSN2goUibRHfiIYtneazEh70m+ECppBr?=
 =?us-ascii?Q?qEEzkDxOlbvRWHyGTfsILRpxer/pvt7anaHI7Vcn9c9MuDXd0h/9ZMZ0FaYL?=
 =?us-ascii?Q?pwgYXZVtD88mxy16yABn2Xhmx97n9BKEm9QsIecrQ+/I+d9As3sS9mD+1O0e?=
 =?us-ascii?Q?f18HfViMlFcA4Itwqeab2lkrK4HpxpkPmzFWmQoZQE+0RdUS/YzLpVGi0z+M?=
 =?us-ascii?Q?zBFSEX0fTG0kZcSWg1uXYwUsCL9QXSZL/5QReCz0JAgJuRfyEP8OT/SmJW0e?=
 =?us-ascii?Q?xxn7vZ2MCGKDXxhUqcJilxJxoqTn6425q7EZ71hStXNXOqLrrvgbklivAJhx?=
 =?us-ascii?Q?eYSMzldhQk6Byit2nFGuweHyjg+RScTW/BcyMov8acq/T6ot+M2EkSlYebmC?=
 =?us-ascii?Q?dT/xzcZA8BlZjXzCaVUX3CyZ8DlT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SogDaK/sMx+QlKAHlQQsKysMutgMguRP61S7t515MHU5S6YEMLT4A5qaIo4/?=
 =?us-ascii?Q?eEyY2c2YnLIp/rjcDAIgHs3QNFGKz08zzOSd62iG6QRwK0jMlNYnXYx8fUbd?=
 =?us-ascii?Q?02A4ICsQwCcdl+kdmlCRDmoDeeN78KnRXuvyz59Lw684UizOYIe5ejr8UKg4?=
 =?us-ascii?Q?MO21ZZIwqXMyPHFhezTniZsSaJcu890oIew8EVWdFaF1Cyzb0GD8tlkC2vZh?=
 =?us-ascii?Q?+lQCFffbE7o6y2Sz5bbpTgXdv9Jw8KkkuHpbKcWtzjzQK1DjenHM1cOdOQMk?=
 =?us-ascii?Q?6WXBA/Lrt9AM/p+bR2bR53JdDZevNdlTwolAROxwkZsnSnIwMKFshdIKtZo2?=
 =?us-ascii?Q?DoAxlv8I/VV7P3DJk/5dgo8mHl+kr5AYHtPD1drY3jAPJbMT7+hOuMg8gPzl?=
 =?us-ascii?Q?l3xzcZRc2ZH2z9XrfLZHmgHVgoHpGNws+T3fQlVVBM0d3tW/UGqEinb853Ez?=
 =?us-ascii?Q?AwixkFjBqORP/DNN26kvNQwz4q1AiTRt4Qp/FYHba7rQWv1v9p3Zvo2hwNNQ?=
 =?us-ascii?Q?iJmXMpYhi749DDeU28Ikav37Y2StILOTJpsJy7Y2lHMPRYvoTMLrCobx91rY?=
 =?us-ascii?Q?VG5rI+CJj2/oQ6BLE+RIzb3nOorImEoEpdsLob+JPfcsAfRasZPWICk+S6/z?=
 =?us-ascii?Q?xuzYD+6vK7G+sTHcCjIpj6dCvvq2WaQdfz6l3IeY0KjmWAamF0AdSHKhI3kc?=
 =?us-ascii?Q?dXecQ88YkTrNcfnI2XDYL2iw4FfHfaerEuc/JljfnEVRTb2yf+aFewYeqYQY?=
 =?us-ascii?Q?EsnRDeijf26PeHewZ8xhHQlUxjfB98wNkljHA6VA5pgzeKa9Vcv/9dZgDCai?=
 =?us-ascii?Q?qH7bgY2XdtO6aBsnnpRFUqGE+HBibbULczc5i1F+K3cxHf9/FwYL6M828vWM?=
 =?us-ascii?Q?ERYhOkiYY953fDwBhKLP7BHwI9rO//lnZQza1Mwd2n/JDmBj+2cQMgPptLMZ?=
 =?us-ascii?Q?SBKnpuJyml4KbVRbVgV+w1jgXzpNKuIjJdlDXlZQElQ5p918mSF3F9ebWGwA?=
 =?us-ascii?Q?F8MMf+w92Ea7YgUv3mtEkw7utMBEPEtPq7etypj44Q4jbOU+xQm19WmQlsEB?=
 =?us-ascii?Q?eBKBCaX3R/CBPAtS2R3CsIhTVUFoxfjFhXZsxDfbrJGgOKBDi++44Hex5dL4?=
 =?us-ascii?Q?5ci6qH20t7Iqg9urtXfmgBfrV0SXx+ylNyjm917WkcxpLr1RVbX1meE2ZqHY?=
 =?us-ascii?Q?5o88kgeMj7k2cpVrB93eZWn5MRcO7v2kFpdE8uFXnu+Z4vap3tpf5+IerxV3?=
 =?us-ascii?Q?FZsCOo0zsfC7N2TvwleHkAxrDKw9D6dJzuh7pCqpHX53S0Ub71inTYbCHhIp?=
 =?us-ascii?Q?LR3KcwtZmJmpTVzjcczpvuFe/dox0MKi9AS+3cRDdXiApOv00R2IjOjqbIPj?=
 =?us-ascii?Q?TDEW13bf9GLWKKJkU4Vc9LyEzRzVPhZ2mVhfNwrKxp3hrHheOy/O0G4I5eFE?=
 =?us-ascii?Q?FVf2nJpkgN3R09zhl1k+0hswpXCn8LDbz+Ir+7l6qHzBnqLCL0Szi/hSHwRz?=
 =?us-ascii?Q?cCoM1/m8ZryQcfuWDmTAIeXOTu7e/QY28gaBKOFExLikHsxmuLOi1F2tkA2q?=
 =?us-ascii?Q?CPWGgfJ3sQiz8Rv6rHtfTikGJ6qVaD3VWl5DEDS3geAyQZ7igVoEvSEEZpEI?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QZeMyaoyr1A14j+RnjTts2xTXAO0Ixg2LNYAWIS2n9eX8T7Bpppt1SwJqF07xqdf/kULYhxX8y9gcDgxd4/HK8Yj/AH/ELTpVImp7hkNNPVXh+ZBtm3sD2PysrjsEQ+9dc86q9n9tAV6J3EmYa/gol1TRI7E13SynWNt9IPfRc6kBmBkiMlZ/+Qf3iJA/DWmO+b0WpjmFbYbnnGFl/Nri/7SbmUorzfPICQabtfr/NwR+9CAWim6mL3QLInnoBxVfiaTPJekmeh4rqpjVh63uhhh9uUJeOFmK3eG+/kKuvS37NOPXoOPxLsKIkk9wO/m3U17HaqPZQivP0dFxbK2uqt6R4kH+vrdHMZnzO4v/0HPtxUGj2tJUMPPuc7oq3ho1wRFNI6l8q95b7Kujk2fkoZTIUvSJngaAud0bIrSQC23Wyg+oLbR3OkgkfzIU4WgpUD9uwpwObb5WKwdP2xsgrMJlzNLetkP5H9lHRZT5u3Qz2IHMd6di7BmWFGzBeBSesMxXSdxG48/gphJ9DpgMnRAweUPSCmhUY3/gUyySxfVZ0L33O9ACZU1GMbycCpZZ5Bdff5Kc8wChXI4cUwy+3BRa6SfIT4EZ9ny9qg1nfM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a09e90-6590-4958-5315-08dd664f5257
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 19:01:42.8098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eE9ov/ZhbsLVVMbBLwdThEjb0A7DWlJ2vj/+Q4llFk6Jke6CdOUXzbhHWL3md0RFazY3eQzt6cYS08jeywprYRnxPx1c05CzVdWVYm6t6Xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503180137
X-Proofpoint-GUID: dfsDv3iYKdtIb_V91qCmvDDxlG68iIlj
X-Proofpoint-ORIG-GUID: dfsDv3iYKdtIb_V91qCmvDDxlG68iIlj

On Tue, Mar 18, 2025 at 02:59:45PM -0400, Eugene Loh wrote:
> But if it is a dependency, it would be nice to know there is a problem.

I believe we would already know there is a problem because of other tests
failing.

> On 3/18/25 14:17, Kris Van Hees wrote:
> > This seems like a test that would belong in the kernel tree rather than in
> > DTrace?  It seems like a weird tst to have included in DTrace because if it
> > fails, we cannot do anything about it in DTrace anyway.
> > 
> > I'd rather leave out tests that exercise things that are not DTrace itself.
> > 
> > On Thu, Jan 09, 2025 at 04:47:10PM +0000, Nick Alcock wrote:
> > > Some early prototype deduplicators dedupped types in one dict (more or less)
> > > rather than putting conflicting types and module types into
> > > sub-dictionaries.  Fail if the running kernel is such a kernel.
> > > 
> > > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> > > ---
> > >   dtrace.spec                  |  2 +-
> > >   test/smoke/tst.ctf-intact.sh | 58 ++++++++++++++++++++++++++++++++++++
> > >   2 files changed, 59 insertions(+), 1 deletion(-)
> > >   create mode 100755 test/smoke/tst.ctf-intact.sh
> > > 
> > > diff --git a/dtrace.spec b/dtrace.spec
> > > index 902ad7d8bb980..cf960f14b55c7 100644
> > > --- a/dtrace.spec
> > > +++ b/dtrace.spec
> > > @@ -151,7 +151,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
> > >   Requires:     java-1.8.0-openjdk-devel perl-IO-Socket-IP xfsprogs
> > >   Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
> > >   Requires:     coreutils wireshark %{glibc32}
> > > -Requires:     perf time bc nfs-utils
> > > +Requires:     perf time bc nfs-utils binutils
> > >   Autoreq:      0
> > >   Group:	      Development/System
> > > diff --git a/test/smoke/tst.ctf-intact.sh b/test/smoke/tst.ctf-intact.sh
> > > new file mode 100755
> > > index 0000000000000..d737a2b162fcb
> > > --- /dev/null
> > > +++ b/test/smoke/tst.ctf-intact.sh
> > > @@ -0,0 +1,58 @@
> > > +#!/bin/bash
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > 2024 -> 2025
> > 
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +
> > > +#
> > > +# This script verifies that the CTF, if present, is non-corrupt: in
> > > +# particular, that it has at least one child with
> > The rest of the comment is missing?
> > 
> > > +#
> > > +
> > > +ctf="/lib/modules/$(uname -r)/kernel/vmlinux.ctfa"
> > > +
> > > +if [[ ! -f "$ctf" ]]; then
> > > +    echo "CTF not found in expected location of $ctf" >&2
> > > +    exit 67
> > > +fi
> > > +
> > > +# If this is not an ELF file, turn it into one so objdump works.
> > > +if ! [[ "$(file "$ctf")" =~ ELF ]]; then
> > > +    objcopy --add-section=.ctf="$ctf" /bin/true $tmpdir/ctf
> > > +    ctf=$tmpdir/ctf
> > > +fi
> > > +
> > > +# Dump the CTF
> > > +objdump --ctf --ctf-parent=shared_ctf "$ctf" 2>/dev/null | \
> > > +    awk '
> > > +BEGIN {
> > > +    intypes=0;
> > > +}
> > > +
> > > +/^  Strings:|^CTF archive member:/ {
> > > +    intypes = 0;
> > > +}
> > > +# Scan for each member, capture its name.
> > > +/^CTF archive member: / {
> > > +    member=gensub (/CTF archive member: (.*):/,"\\1", "g");
> > > +    next;
> > > +}
> > > +# See if any non-shared dicts have any types in.
> > > +/^  Types:/ {
> > > +    if (member != "shared_ctf") {
> > > +        intypes=1;
> > > +    }
> > > +}
> > > +/^    0x/ {
> > > +    if (intypes) {
> > > +        exit (0);
> > > +    }
> > > +}
> > > +END {
> > > +    if (!intypes) {
> > > +        printf ("No non-shared-dict types found: probably buggy deduplicator.\n");
> > > +        exit (1);
> > > +    }
> > > +}'
> > > -- 
> > > 2.47.1.279.g84c5f4e78e
> > > 
